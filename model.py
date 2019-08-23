from flask_sqlalchemy import SQLAlchemy
# from server import app

db = SQLAlchemy()


class User(db.Model):
    """Users of board game website."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)

    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(64), nullable=False)

    favorites = db.relationship("BoardGame", secondary="favorites",
                                    backref="users")


    def __repr__(self):
        """Provide helpful User info when printed."""

        return f"<User user_id={self.user_id}, name={self.name}, email={self.email}>"


class BoardGame(db.Model):
    """Board Game Object."""

    __tablename__ = "boardgames"

    bg_id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    bg_name = db.Column(db.String, nullable=False)
    thumbnail_url = db.Column(db.String, nullable=False, default='/static/image/placeholder.png')
    image_url = db.Column(db.String, nullable=False)
    description = db.Column(db.Text, nullable=False)

    playtime = db.Column(db.Integer, nullable=False)
    min_time = db.Column(db.Integer, nullable=False)
    max_time = db.Column(db.Integer, nullable=False)

    year_published = db.Column(db.Integer, nullable=False) #maybe do datetime for learning!

    min_players = db.Column(db.Integer, nullable=False)
    max_players = db.Column(db.Integer, nullable=False)
    suggested_players = db.Column(db.Integer, nullable=False)

    designer = db.Column(db.String(100), nullable=False)
    publisher = db.Column(db.String, nullable=False)


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


class BgTag(db.Model):
    """A collection of a board games's tags/categories."""

    __tablename__ = "bg_tags"
    __table_args__ = (db.UniqueConstraint('user_id', 'bg_id', 'tag_id'),)

    tagged_bg_id = db.Column(db.Integer, autoincrement=True, primary_key=True)

    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    bg_id = db.Column(db.Integer, db.ForeignKey('boardgames.bg_id'))
    tag_id = db.Column(db.Integer, db.ForeignKey('tags.tag_id'))


    def __repr__(self):
        """Provide helpful Favorite info when printed."""

        return f"<BgTag tagged_bg_id={self.tagged_bg_id}, tag_id={self.tag_id}, bg_id={self.bg_id}, user_id={self.user_id}>"


class Tag(db.Model):
    """A list of tags that can be applied to a board game."""

    tag_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    tag_name = db.Column(db.String(75), nullable=False)


    def __repr__(self):
        """Provide helpful Favorite info when printed."""

        return f"<Tag tag_id={self.tag_id}, tag_name={self.tag_name}>"




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










