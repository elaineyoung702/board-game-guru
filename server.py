from flask import Flask, request
from flask import render_template, redirect, flash
# from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from model import connect_to_db, db, BoardGame, User, Favorite



app = Flask(__name__)

app.secret_key = "s00persekret"

app.jinja_env.undefinted = StrictUndefined


@app.route('/')
def index():
    """Homepage."""

    return render_template("homepage.html")


@app.route('/login', methods=["POST"])
def show_login_page():
    """Show Login Form."""

    user_list = User.query.all()

    email = request.form.get("email")
    password = request.form.get('password')

    for user in user_list:
        if user.email == email and user.password == password:
            return render_template("favorites.html")
        else:
            return render_template("login.html")



@app.route('/boardgame/<bg_id>')
def show_boardgame_info(bg_id):
    """Show Board Game Info Page."""

    boardgame = db.session.query(BoardGame).filter_by(bg_id=bg_id).one()

    return render_template('boardgame.html', boardgame=boardgame)


@app.route('/database')
def show_database():
    """Show Board Game Database."""

    bg_obj_list = db.session.query(BoardGame).all()

    return render_template('database.html', bg_obj_list=bg_obj_list)


@app.route('/favorites')
def show_favorites():
    """Show User's Favorite Board Games."""

    return render_template('base.html')


@app.route('/search')
def show_search_form():
    """Show Search Form."""

    return render_template('base.html')




if __name__ == "__main__":
    app.debug = True
    # app.jijna_env.auto_reload = app.debug

    connect_to_db(app)

    # DebugToolbarExtension(app)

    app.run(port=5000, host="0.0.0.0")