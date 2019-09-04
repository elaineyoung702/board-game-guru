from flask_sqlalchemy import SQLAlchemy

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
    bg_tags = db.relationship("Tag", secondary="bg_tags",
                                    backref="users")

    def __repr__(self):
        """Provide helpful User info when printed."""

        return f"<User user_id={self.user_id}, name={self.name}, email={self.email}>"

    def get_tags_by_bg(self, bg_id):
        """Get user's tags for board game by board game id."""

        tag_ids = db.session.query(BgTag.tag_id
                                   ).filter(BgTag.user_id == self.user_id,
                                            BgTag.bg_id == bg_id).all()

        tags = [Tag.query.get(t_id) for t_id in tag_ids]

        return tags


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

    bg_tags = db.relationship("Tag", secondary="bg_tags",
                                    backref="boardgames")

    def __repr__(self):
        """Provide helpful BoardGame info when printed."""

        return f"<BoardGame bg_id={self.bg_id}, bg_name={self.bg_name}>"

    def count_tags(self, tag_id):
        """Return count of tags with the given `tag_id`."""

        tags = [tag for tag in self.bg_tags if tag.tag_id == tag_id]

        return len(tags)


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

    __tablename__ = "tags"

    tag_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    tag_name = db.Column(db.String(75), nullable=False)
    tag_description = db.Column(db.Text, nullable=False)

    def __repr__(self):
        """Provide helpful Favorite info when printed."""

        return f"<Tag tag_id={self.tag_id}, tag_name={self.tag_name}>"


#########################################################################


def connect_to_db(app, db_uri="postgresql:///boardgames"):
    """Connect the databse to our Flask app"""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


def example_data():
    """Create sample data for database tests."""

    User.query.delete()
    BoardGame.query.delete()
    Tag.query.delete()

    jack = User(name="Jack", email="jack@test.com", password="test")
    vonny = User(name="Vonny", email="vonny@test.com", password="test")
    romain = User(name="Romain", email="romain@test.com", password="test")

    pandemic = BoardGame(bg_id=9000, bg_name="Pandemic Legacy, Season 1", 
                thumbnail_url="https://cf.geekdo-images.com/itemrep/img/n8626bWQOoE_1nqvLUXi_6QfYO0=/fit-in/246x300/pic2452831.png", 
                image_url="https://cf.geekdo-images.com/itemrep/img/n8626bWQOoE_1nqvLUXi_6QfYO0=/fit-in/246x300/pic2452831.png", 
                description="Pandemic is an awesome co-op game battling diseases!", playtime=260, 
                min_time=150, max_time=500, year_published=2018, min_players=2, max_players=4, 
                suggested_players=4, designer="Designer1", publisher="Publisher1")
    monopoly = BoardGame(bg_id=8633, bg_name="Monopoly: Disney", 
                thumbnail_url="https://cf.geekdo-images.com/thumb/img/MUM8GIWh7cs_Oc22kxGEaNkoEqo=/fit-in/200x150/pic55937.jpg", 
                image_url="https://cf.geekdo-images.com/thumb/img/MUM8GIWh7cs_Oc22kxGEaNkoEqo=/fit-in/200x150/pic55937.jpg", 
                description="DISNEY MONOPOLY!", playtime=60, min_time=60, max_time=100, 
                year_published=2001, min_players=2, max_players=8, suggested_players=5, 
                designer="Designer2", publisher="Publisher2")
    dominion = BoardGame(bg_id=36218, bg_name="dominion", 
                thumbnail_url="https://cf.geekdo-images.com/itemrep/img/7mkW_JrUx0PSa4Ame3zzsLE0BVY=/fit-in/246x300/pic394356.jpg", 
                image_url="https://cf.geekdo-images.com/itemrep/img/7mkW_JrUx0PSa4Ame3zzsLE0BVY=/fit-in/246x300/pic394356.jpg", 
                description="Dominion is a game where you compete to win using various strategies.", 
                playtime=60, min_time=20, max_time=95, year_published=2008, min_players=2, 
                max_players=6, suggested_players=4, designer="Designer3", publisher="Publisher3")
    
    coop = Tag(tag_name="Cooperative", tag_description="Players usually play against the game and work together towards the same goal")
    classic = Tag(tag_name="Classic", tag_description="Classic Board Game")
    family = Tag(tag_name="Family", tag_description="Good for kids and parents of all ages")
    legacy = Tag(tag_name="Legacy", tag_description="Legacy games incoporate a changing board and ongoing story changes")


    db.session.add_all([jack, vonny, romain, pandemic, monopoly, dominion, coop, classic, family, legacy])
    db.session.commit()


#############################################

if __name__ == "__main__":
    from flask import Flask
    app = Flask(__name__)

    # from server import app
    connect_to_db(app)
    print("Connected to DB.")










