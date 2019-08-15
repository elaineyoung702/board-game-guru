from flask import Flask
from flask import render_template, redirect, flash
# from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from model import connect_to_db, db, BoardGame



app = Flask(__name__)

app.secret_key = "s00persekret"

app.jinja_env.undefinted = StrictUndefined

@app.route('/')
def index():
    """Homepage."""

    return render_template("homepage.html")


@app.route('/login')
def show_login_page():
    """Show Login Form."""

    return render_template("base.html")



@app.route('/favorites')
def show_favorites():
    """Show User's Favorite Board Games."""

    return "<html><body>Placeholder</body></html>"


@app.route('/boardgame')
def show_boardgame_info():
    """Show Board Game Info Page."""

    boardgame = db.session.query(BoardGame).filter_by(bg_id=3).one()
    id = boardgame.bg_id


    return render_template('boardgame.html', boardgame=boardgame, id=id)



@app.route('/database')
def show_database():
    """Show Board Game Database."""

    return "<html><body>Placeholder</body></html>"


@app.route('/search')
def show_search_form():
    """Show Search Form."""

    return "<html><body>Placeholder</body></html>"






if __name__ == "__main__":
    app.debug = True
    # app.jijna_env.auto_reload = app.debug

    connect_to_db(app)

    # DebugToolbarExtension(app)

    app.run(port=5000, host="0.0.0.0")