from flask import Flask, request, session
from flask import render_template, redirect, flash, jsonify
# from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from model import connect_to_db, db, BoardGame, User, Favorite, Tag, BgTag



app = Flask(__name__)

app.secret_key = "s00persekret"

app.jinja_env.undefinted = StrictUndefined


@app.route('/')
def index():
    """Display Homepage."""

    return render_template("homepage.html")


@app.route('/login', methods=["POST"])
def login_user():
    """Login User or Redirect to Registration Form."""

    email = request.form.get("email")   #get email provided in form
    password = request.form.get('password') #get passwork provided in form

    try:
        user = db.session.query(User).filter(User.email==email, User.password==password).first() # check this syntax
        session['user_id'] = user.user_id   #set session user_id
        session['user_name'] = user.name.title()
        session['email'] = user.email   #set session email (maybe get rid of this?)
        print(f"SESSION USER EMAIL: {session['email']}") #Debugging prints
        print(f"Session User ID: {session['user_id']}") #Debugging prints
        return redirect('/favorites')
    except AttributeError:
        print("no login") #Debugging prints
        return render_template("register.html") ### REDIRECT THIS


@app.route('/register', methods=["POST"])
def register_new_user():
    """Create New User Account."""

    name = request.form.get('name')
    email = request.form.get("email")   #get email provided in form
    password = request.form.get('password')

    if (email,) in db.session.query(User.email).all():
        print("there is already an account with this email address")
        return render_template('register.html')### REDIRECT THIS
    else:
        user = User(name=name, email=email, password=password)
        db.session.add(user)
        db.session.commit()
        user = db.session.query(User).filter(User.email==email, User.password==password).first() # check this syntax
        session['user_id'] = user.user_id   #set session user_id
        session['user_name'] = user.name.title()
        session['email'] = user.email 
        return render_template('favorites.html') ### REDIRECT THIS


@app.route('/logout', methods=["POST"])
def logout_user():
    """Log User Out and Clear Session Data."""

    session.clear()
    print(session)

    return render_template('homepage.html')


@app.route('/boardgame/<bg_id>')
def show_boardgame_info(bg_id):
    """Show Board Game Info Page."""

    boardgame = BoardGame.query.get(bg_id) # get bg object to pass into jinja
    tags = Tag.query.all() # get all tags to pass into jinja and for interation
    tag_dict = {} #creating dict to pass into jinja with bg/tag counts

    for tag in tags: # for each tag, get tag_id and count for matching bg_id
        tag_id = tag.tag_id
        # print(tag_id)
        count = BgTag.query.filter(BgTag.bg_id==bg_id,BgTag.tag_id==tag_id).count()
        tag_dict[tag_id] = count # add to dict for passing into jinja for displaying

    # print(tag_dict)

    if session:
        user = db.session.query(User).filter_by(user_id=session['user_id']).one()
        user_id = user.user_id
        tag_check = db.session.query(BgTag.tag_id).filter(BgTag.user_id==user_id, BgTag.bg_id==bg_id).all()
        if tags:
            bg_tagged = []
            for tag_tuple in tag_check:
                (tagged, ) = tag_tuple
                bg_tagged.append(tagged)
        return render_template('boardgame.html', boardgame=boardgame, user=user, tags=tags, tag_dict=tag_dict, bg_tagged=bg_tagged)
    else:
        return render_template('boardgame.html', boardgame=boardgame, tags=tags, tag_dict=tag_dict)


@app.route('/database')
def show_database():
    """Show Board Game Database."""
    i = 0

    # bg_obj_list = BoardGame.query.order_by(BoardGame.bg_id.desc()).offset(i).limit(250).all()
    bg_obj_list = BoardGame.query.order_by(BoardGame.bg_id.desc()).all()
    if 'user_id' in session:
        user = User.query.get(session['user_id'])
        user_id = user.user_id
        return render_template('database.html', bg_obj_list=bg_obj_list, user_id=user_id)

    return render_template('database.html', bg_obj_list=bg_obj_list)

# ######################################

@app.route('/check-fav')
def check_for_fav_id():

    if 'user_id' not in session:
        return render_template('register.html')

    else:
        bg_id = request.form.get("bg_id")
        user = User.query.get(session['user_id'])
        user_id = user.user_id
        fav_exist = db.session.query(Favorite).filter(Favorite.user_id==user_id, Favorite.bg_id==bg_id).first()
        # print(fav_exist)
        if fav_exist:
            fav_id = fav_exist.fav_id
            # print(tagged_bg_id)
            Favorite.query.filter(Favorite.fav_id==fav_id).delete()
            db.session.query(Favorite).filter(Favorite.user_id==user_id, Favorite.bg_id==bg_id).first()
            db.session.commit()
            bg_obj_list = user.favorites
            return jsonify( {"deleted" : "true"}) #how do we wanna return from this?
        else:
            bg_id = request.form.get('bg_id')
            bg = BoardGame.query.get(bg_id)
            user.favorites.append(bg)
            db.session.commit()
            bg_obj_list = user.favorites
        return render_template('favorites.html',bg_obj_list=bg_obj_list) #how do we wanna return from this?



@app.route('/favorites', methods=['GET', 'POST'])
def show_favorites():
    """Show User's Favorite Board Games."""

    bg_id = request.form.get("bg_id")
    # print(bg_id)

    if 'user_id' in session:
        user = User.query.get(session['user_id'])

        if request.method == 'POST':
            bg_id = request.form.get('bg_id')
            bg = BoardGame.query.get(bg_id)
            user.favorites.append(bg)
            db.session.commit()
        
        bg_obj_list = user.favorites

        return render_template('favorites.html',bg_obj_list=bg_obj_list)
    else:
        return render_template('register.html')


@app.route('/search-form')
def show_search_form():
    """Show Search Form."""

    designer_set = set()

    bg_list = BoardGame.query.filter(BoardGame.designer !='(Uncredited)').all()
    for item in bg_list:
        designer = item.designer
        designer_set.add(designer)
    designer_list = (sorted(list(designer_set)))

    return render_template('search.html', designer_list=designer_list)


@app.route('/bg-tagged', methods=['POST'])
def tag_a_board_game():

    tag_id = request.form.get("tag_id")
    # print(tag_id)
    user_id = session['user_id']
    # print(user_id)
    bg_id = request.form.get("bg_id")
    # print(bg_id)

    bg_exist = db.session.query(BgTag).filter(BgTag.tag_id==tag_id, BgTag.user_id==user_id, BgTag.bg_id==bg_id).first()
    # print(bg_exist)

    if bg_exist:
        tagged_bg_id = bg_exist.tagged_bg_id
        # print(tagged_bg_id)
        BgTag.query.filter(BgTag.tagged_bg_id==tagged_bg_id).delete()
        db.session.query(BgTag).filter(BgTag.tag_id==tag_id, BgTag.user_id==user_id, BgTag.bg_id==bg_id).first()
        db.session.commit()
        return jsonify( {"deleted" : "true", "tag_id" : tag_id })
    else:
        bgtag = BgTag(user_id=user_id, bg_id=bg_id, tag_id=tag_id)
        db.session.add(bgtag)
        db.session.commit()

        print(f'WOOOOO! Added {bgtag}')

        return jsonify( {"deleted" : "false", "tag_id" : tag_id })


@app.route('/results')
def show_results():
    """Show User Search Results Based on Inputs from Search Form."""

    bg_name = request.args.get('bg_name')
    num_players = request.args.get('num_players')
    playtime = request.args.get('playtime')
    designer = request.args.get('designer')
    publisher = request.args.get('publisher')

    results = []

    if bg_name:
        name_results = get_by_bg_name(bg_name)
        results.extend(name_results)
    if num_players:
        num_results = get_by_num_players(num_players)
        results.extend(num_results)
    if playtime:
        time_results = get_by_playtime(playtime)
        results.extend(time_results)
    if publisher:
        pub_results = get_by_publisher(publisher)
        results.extend(pub_results)
    elif designer:
        des_results = get_by_designer(designer)
        results.extend(des_results)

    return render_template('results.html', results=results)


def get_by_bg_name(bg_name):
    bg_name = bg_name.title().replace(" ", "%")
    bg_name_cat = f'%{bg_name}%'
    print(bg_name_cat)
    name_search_results = BoardGame.query.filter(BoardGame.bg_name.like(f"{bg_name_cat}")).all()
    print (f'BG Name Match: {name_search_results}')
    return name_search_results

def get_by_num_players(num_players):
    best_fit = BoardGame.query.filter(BoardGame.suggested_players == num_players).all()
    print(f'Num Player Best Fit: {best_fit}')

    if best_fit:
        return best_fit
    else:
        match_players = BoardGame.query.filter(BoardGame.min_players <= num_players,
            BoardGame.max_players >= num_players).all()
        print(f'Other Matches: {match_players}')
        return match_players

def get_by_playtime(time):
    best_fit = BoardGame.query.filter(BoardGame.playtime == time).all()
    print(f'Playtime Best Fit: {best_fit}')
    if best_fit:
        return best_fit
    else:
        match_playtime = BoardGame.query.filter(BoardGame.min_time <= time,
                BoardGame.max_time >= time).all()
        print(f'Other Matches: {match_playtime}')
        return match_playtime

def get_by_designer(designer):
    match = BoardGame.query.filter(BoardGame.designer == designer).all()
    if match:
        print(match)
        return match
    else:
        print("no match")
        return redirect('/search-form')

def get_by_publisher(publisher):
    publisher = publisher.title().replace(" ", "%")
    publisher_cat = f'%{publisher}%'
    print(publisher_cat)
    name_search_results = BoardGame.query.filter(BoardGame.publisher.like(f"{publisher_cat}")).all()
    print (f'publisher Name Match: {name_search_results}')
    return name_search_results



###### WIP to combine search results instead of doing only one search on 1 criteria
###### WIP refactor designer dropdown to be input text with SQL LIKE query because the dropdown is out of control
        #######if time permits, then try to create an auto complete function





##############################################################
if __name__ == "__main__":
    app.debug = True
    # app.jijna_env.auto_reload = app.debug

    connect_to_db(app)

    # DebugToolbarExtension(app)

    app.run(port=5000, host="0.0.0.0")