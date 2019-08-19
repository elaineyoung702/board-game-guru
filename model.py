from flask_sqlalchemy import SQLAlchemy
# from server import app

db = SQLAlchemy()


class User(db.Model):
    """Users of board game website."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)

    name = db.Column(db.String(50), nullable=True)
    email = db.Column(db.String(50), nullable=True)
    password = db.Column(db.String(64), nullable=True)

    favorites = db.relationship("BoardGame", secondary="favorites",
                                    backref="users")


    def __repr__(self):
        """Provide helpful User info when printed."""

        return f"<User user_id={self.user_id}, name={self.name}, email={self.email}>"


class BoardGame(db.Model):
    """Board Game Object."""

    __tablename__ = "boardgames"

    bg_id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    bg_name = db.Column(db.String, nullable=True)
    thumbnail_url = db.Column(db.String, nullable=False, default='/static/image/placeholder.png')
    image_url = db.Column(db.String, nullable=False)
    description = db.Column(db.Text, nullable=False)

    playtime = db.Column(db.Integer, nullable=True)
    min_time = db.Column(db.Integer, nullable=False)
    max_time = db.Column(db.Integer, nullable=False)

    year_published = db.Column(db.Integer, nullable=True) #maybe do datetime for learning!

    min_players = db.Column(db.Integer, nullable=True)
    max_players = db.Column(db.Integer, nullable=True)
    suggested_players = db.Column(db.Integer, nullable=True)

    designer = db.Column(db.String(100), nullable=False)


    def __repr__(self):
        """Provide helpful BoardGame info when printed."""

        return f"<BoardGame bg_id={self.bg_id}, bg_name={self.bg_name}>"


class Favorite(db.Model):
    """A collection of user's favorite board games."""

    __tablename__ = "favorites"
    __table_args__ = (db.UniqueConstraint('user_id', 'bg_id'),)

    fav_id = db.Column(db.Integer, autoincrement=True, primary_key=True)

    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    bg_id = db.Column(db.Integer, db.ForeignKey('boardgames.bg_id'))


    def __repr__(self):
        """Provide helpful Favorite info when printed."""

        return f"<Favorite fav_id={self.fav_id}, user_id={self.user_id}, bg_id={self.bg_id}>"


#########################################################################
# Helper Functions

def connect_to_db(app):
    """Connect the databse to our Flask app"""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///boardgames' ####CHECK THIS
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    from flask import Flask
    app = Flask(__name__)

    # from server import app
    connect_to_db(app)
    print("Connected to DB.")










