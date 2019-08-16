from flask import Flask, request, session
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

    user_list = User.query.all()    #obtain all user objects within users table

    if user_list == []:
        return render_template("login.html")

    email = request.form.get("email")   #get email provided in form
    password = request.form.get('password') #get passwork provided in form

    for user in user_list:  #check to see if user is in users table
        if user.email == email and user.password == password:   #check email/password match with db
            session['user_id'] = user.user_id   #set session user_id
            session['email'] = user.email   #set session email (maybe get rid of this?)
            print(f"SESSION USER EMAIL: {session['email']}") #Debugging prints
            print(f"Session User ID: {session['user_id']}") #Debugging prints
            return redirect('/favorites')
        else:
            print("no login") #Debugging prints
            return render_template("login.html")



@app.route('/boardgame/<bg_id>')
def show_boardgame_info(bg_id):
    """Show Board Game Info Page."""

    boardgame = db.session.query(BoardGame).filter_by(bg_id=bg_id).one()

    if session:
        user = db.session.query(User).filter_by(user_id=session['user_id']).one()
        return render_template('boardgame.html', boardgame=boardgame, user=user)
    else:
        return render_template('boardgame.html', boardgame=boardgame)



@app.route('/database')
def show_database():
    """Show Board Game Database."""

    bg_obj_list = db.session.query(BoardGame).all()

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
        return render_template('login.html')



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