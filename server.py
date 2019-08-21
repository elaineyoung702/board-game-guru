from flask import Flask, request, session
from flask import render_template, redirect, flash
# from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from model import connect_to_db, db, BoardGame, User, Favorite



app = Flask(__name__)

app.secret_key = "s00persekret"

app.jinja_env.undefinted = StrictUndefined


BG_ATTR_LIST = ['bg_name', 'thumbnail_url', 'image_url', 'description', 'playtime', 
        'min_time', 'max_time', 'year_published', 'min_players', 'max_players', 
        'suggested_players', 'designer', 'publisher']


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
        print(User.query.all())
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

    boardgame = BoardGame.query.get(bg_id)

    if session:
        user = db.session.query(User).filter_by(user_id=session['user_id']).one()
        return render_template('boardgame.html', boardgame=boardgame, user=user)
    else:
        return render_template('boardgame.html', boardgame=boardgame)


@app.route('/database')
def show_database():
    """Show Board Game Database."""

    # sort_by = request.args.get('sort_col')

    # if sort_by:  ##### ATTEMPT TO REFACTOR TO SIMPLIFY
    #     bg_obj_lsit = BoardGame.query.filter(BoardGame.bg_name.like(f"{sort_by}")).all()


    if request.args.get('sort_col') == "playtime":
        bg_obj_list = BoardGame.query.order_by(BoardGame.playtime.desc()).all()  

    elif request.args.get('sort_col') == "min_players":
        bg_obj_list = BoardGame.query.order_by(BoardGame.min_players.desc()).all()
    
    else:
        bg_obj_list = BoardGame.query.all()

    return render_template('database.html', bg_obj_list=bg_obj_list)


@app.route('/favorites', methods=['GET', 'POST'])
def show_favorites():
    """Show User's Favorite Board Games."""

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
    print("****************")

    return render_template('search.html', designer_list=designer_list)


@app.route('/results')
def show_results():
    """Show User Search Results Based on Inputs from Search Form."""

    bg_name = request.args.get('bg_name')
    num_players = request.args.get('num_players')
    playtime = request.args.get('playtime')
    designer = request.args.get('designer')

    # sort_col = request.args.get('sort_col')

    if bg_name:
        results = get_by_bg_name(bg_name)
    elif num_players:
        results = get_by_num_players(num_players)
    elif playtime:
        results = get_by_playtime(playtime)
    elif designer:
        results = get_by_designer(designer)

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
    print("*******************")
    print()
    print()
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


###### WIP to combine search results instead of doing only one search on 1 criteria
###### WIP to display results to user on a results page
###### WIP refactor designer dropdown to be input text with SQL LIKE query because the dropdown is out of control
        #######if time permits, then try to create an auto complete function





##############################################################
if __name__ == "__main__":
    app.debug = True
    # app.jijna_env.auto_reload = app.debug

    connect_to_db(app)

    # DebugToolbarExtension(app)

    app.run(port=5000, host="0.0.0.0")