from flask import Flask, request, session, render_template, redirect, jsonify
from jinja2 import StrictUndefined
from model import connect_to_db, db, BoardGame, User, Favorite, Tag, BgTag
import os

app = Flask(__name__)

app.secret_key = os.environ.get('FLASK_SECRET_KEY')

app.jinja_env.undefinted = StrictUndefined


@app.route("/")
def show_front_page():
    """Display Board Game Guru Front Page."""

    return render_template("homepage.html")


@app.route("/selection")
def display_homepage():
    """Display Homepage."""

    return render_template("selection.html")


@app.route("/login", methods=["POST"])
def login_user():
    """Login User or Redirect to Registration Form."""

    email = request.form.get("email")
    password = request.form.get("password")

    try:
        user = User.query.filter(User.email == email,
                                 User.password == password
                                 ).first()

        session["user_id"] = user.user_id
        session["user_name"] = user.name.title()
        session["email"] = user.email

        return redirect("/favorites")

    except AttributeError:
        print("no login")

        return render_template("register.html")


@app.route("/register", methods=["POST"])
def register_new_user():
    """Create New User Account."""

    name = request.form.get("name")
    email = request.form.get("email")
    password = request.form.get("password")

    if User.query.filter(User.email == email).first():
        print("There is already an account with this email address")

        return redirect("/")

    else:
        user = User(name=name, email=email, password=password)

        db.session.add(user)
        db.session.commit()

        session["user_id"] = user.user_id   #set session user_id
        session["user_name"] = user.name.title()
        session["email"] = user.email 

        return render_template("favorites.html") ### REDIRECT THIS


@app.route("/logout", methods=["POST"])
def logout_user():
    """Log User Out and Clear Session Data."""

    session.clear()

    return redirect("/")


@app.route("/boardgame/<bg_id>")
def show_boardgame_info(bg_id):
    """Show Board Game Info Page."""

    boardgame = BoardGame.query.options(db.joinedload("bg_tags")).get(bg_id) 

    all_tags = Tag.query.all() # get all tags to pass into jinja and for interation
    tag_dict = {} #creating dict to pass into jinja with bg/tag counts

    for tag in all_tags: # for each tag, get tag_id and count for matching bg_id
        tag_id = tag.tag_id
        count = boardgame.count_tags(tag_id)
        tag_dict[tag_id] = count # add to dict for passing into jinja for displaying
        
    try:
        if session["user_id"]:
            user = User.query.get(session["user_id"])

            user_id = user.user_id
            users_tags = set(user.get_tags_by_bg(bg_id))

            if all_tags:
                for tag in all_tags:
                    tag.tagged_by_user = tag in users_tags

            fav_exist = Favorite.query.filter(Favorite.user_id == user_id,
                                              Favorite.bg_id == bg_id).first()
        
            return render_template("boardgame.html",
                                   boardgame=boardgame,
                                   user=user,
                                   tags=all_tags,
                                   tag_dict=tag_dict,
                                   fav_exist=fav_exist)
        
    except KeyError:

        return render_template("boardgame.html",
                                boardgame=boardgame,
                                tags=all_tags,
                               tag_dict=tag_dict,
                               fav_exist=None)



@app.route("/database")
def show_database():
    """Show Board Game Database."""

    bg_obj_list = BoardGame.query.order_by(BoardGame.bg_id.desc()).limit(25).all()

    if "user_id" in session:
        user = User.query.get(session["user_id"])
        user_id = session["user_id"]

        user_favs = User.get_user_favs(user)

        return render_template("database.html",
                               bg_obj_list=bg_obj_list,
                               user_id=user_id, user_favs=user_favs)

    return render_template("database.html",
                           bg_obj_list=bg_obj_list)


@app.route("/new-favorite", methods=["POST"])
def check_favorites_table():

    try:
        bg_id = request.form.get("bg_id")
        user = User.query.get(session["user_id"])
        user_id = user.user_id

        fav_exist = Favorite.query.filter(Favorite.user_id==user_id,
                                          Favorite.bg_id==bg_id).first()

        if fav_exist:
            fav_id = fav_exist.fav_id
            Favorite.query.filter(Favorite.fav_id==fav_id).delete()
            db.session.commit()

            return jsonify( {"favorited" : False, "bg_id" : bg_id})

        else:
            bg_id = request.form.get("bg_id")
            bg = BoardGame.query.get(bg_id)
            user.favorites.append(bg)
            db.session.commit()

            return jsonify( {"favorited" : True, "bg_id" : bg_id})

    except KeyError:

        return render_template("register.html")


@app.route("/favorites")
def show_user_favorites():
    """Show User"s Favorite Board Games."""

    if "user_id" in session:
        user = User.query.get(session["user_id"])
        bg_obj_list = user.favorites

        return render_template("favorites.html",bg_obj_list=bg_obj_list)

    else:

        return render_template("register.html")


@app.route("/search-form")
def show_search_form():
    """Show Search Form."""

    designer_set = set()

    bg_list = BoardGame.query.filter(BoardGame.designer !="(Uncredited)").all()

    for item in bg_list:
        designer = item.designer
        designer_set.add(designer)

    designer_list = (sorted(list(designer_set)))

    tag_list = Tag.query.all()

    return render_template("search.html", designer_list=designer_list, tag_list=tag_list)


@app.route("/bg-tagged", methods=["POST"])
def tag_a_board_game():

    tag_id = request.form.get("tag_id")
    user_id = session["user_id"]
    bg_id = request.form.get("bg_id")

    bg_exist = BgTag.query.filter(BgTag.tag_id==tag_id, BgTag.user_id==user_id,
                                  BgTag.bg_id==bg_id).first()

    if bg_exist:
        tagged_bg_id = bg_exist.tagged_bg_id
        BgTag.query.filter(BgTag.tagged_bg_id==tagged_bg_id).delete()
        db.session.commit()

        return jsonify( {"deleted" : "true", "tag_id" : tag_id })

    else:
        bgtag = BgTag(user_id=user_id, bg_id=bg_id, tag_id=tag_id)
        db.session.add(bgtag)
        db.session.commit()

        return jsonify( {"deleted" : "false", "tag_id" : tag_id })


@app.route("/results")
def show_results():
    """Show User Search Results Based on Inputs from Search Form."""

    bg_name = request.args.get("bg_name")
    num_players = request.args.get("num_players")
    playtime = request.args.get("playtime")
    designer = request.args.get("designer")
    publisher = request.args.get("publisher")
    tag_ids = request.args.getlist("bg_tag")

    results = set()

    if bg_name:
        name_results = get_by_bg_name(bg_name)
        results.update(set(name_results))

    if tag_ids:
        bg_tag_results = get_by_bg_tag(tag_ids)
        results.update(bg_tag_results)

    if num_players:
        num_results = get_by_num_players(num_players)
        results.update(num_results)

    if playtime:
        time_results = get_by_playtime(playtime)
        results.update(time_results)

    if publisher:
        pub_results = get_by_publisher(publisher)
        results.update(pub_results)

    if designer:
        des_results = get_by_designer(designer)
        results.update(des_results)

    return render_template("results.html", results=results)


def get_by_bg_name(bg_name):
    """Get board games with matching board game name."""

    bg_name = bg_name.title().replace(" ", "%")
    bg_name_cat = f"%{bg_name}%"

    name_search_results = BoardGame.query.filter(BoardGame.bg_name.like
                                                (f"{bg_name_cat}")).all()

    return set(name_search_results)


def get_by_num_players(num_players):
    """Get board games with matching number of players."""

    best_fit = BoardGame.query.filter(BoardGame.suggested_players == 
                                        num_players).all()

    if best_fit:

        return set(best_fit)

    else:
        match_players = BoardGame.query.filter(BoardGame.min_players <= num_players,
                                                BoardGame.max_players >= num_players).all()

        return set(match_players)


def get_by_playtime(time):
    """Get board games with matching playtime."""

    best_fit = BoardGame.query.filter(BoardGame.playtime == time).all()

    if best_fit:

        return set(best_fit)

    else:
        match_playtime = BoardGame.query.filter(BoardGame.min_time <= time,
                BoardGame.max_time >= time).all()

        return set(match_playtime)


def get_by_designer(designer):
    """Get board games with matching board game designer name."""

    match = BoardGame.query.filter(BoardGame.designer == designer).all()

    if match:

        return set(match)

    else:

        return redirect("/search-form")


def get_by_publisher(publisher):
    """Get board games with matching board game publisher name."""

    publisher = publisher.title().replace(" ", "%")
    publisher_cat = f"%{publisher}%"

    name_search_results = BoardGame.query.filter(BoardGame.publisher.like(
                                                    f"{publisher_cat}")).all()

    return set(name_search_results)


def get_by_bg_tag(tag_ids):
    """Get board games with matching board game tags."""

    bg_tag_match = set()

    for tag_id in tag_ids:
        bgtags = db.session.query(BgTag).filter(BgTag.tag_id==tag_id).all()

    for bgtag in bgtags:
        bg_id = bgtag.bg_id
        bg_tag_match.add(BoardGame.query.get(bg_id))

    return bg_tag_match



##############################################################

if __name__ == "__main__":

    connect_to_db(app)

    app.run(port=5000, host="0.0.0.0")



