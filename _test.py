import unittest

from server import app
from model import db, connect_to_db, example_data
from model import User, Tag, BoardGame, BgTag, Favorite


class BoardGameGuruTests(unittest.TestCase):
    """Tests for the Board Game Guru Site."""

    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True

    def test_homepage(self):
        result = self.client.get("/")
        self.assertIn(b"Welcome to the Board Game Guru", result.data)


class BoardGameGuruDatabase(unittest.TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True

        connect_to_db(app, "postgresql:///testdb")
        db.create_all()
        example_data()

    def tearDown(self):
        db.session.close()
        db.drop_all()


    def test_db_page(self):
        result = self.client.get("/database")
        self.assertIn(b"Column Headers", result.data)

    def test_user_creation(self):
        robert = User(name="robert", email="robert@test.com", password="test")
        self.assertIsInstance(robert, User)

    def test_boardgame_creation(self):
        unicorns = BoardGame(bg_id=99999, bg_name="Unstable Unicorns", 
                thumbnail_url="https://cf.geekdo-images.com/itemrep/img/35yKKOnpi5NTc4fCjrt9hqRA7qM=/fit-in/246x300/pic3912914.jpg", 
                image_url="https://cf.geekdo-images.com/itemrep/img/35yKKOnpi5NTc4fCjrt9hqRA7qM=/fit-in/246x300/pic3912914.jpg", 
                description="Unstable Unicorns is a very fun game!", 
                playtime=30, min_time=30, max_time=45, year_published=2017, min_players=2, 
                max_players=8, suggested_players=4, designer="Designer8", publisher="Publisher8")
        self.assertIsInstance(unicorns, BoardGame)

    def test_user_favorite_bg(self):
        bg_id = 1
        user_id = 1
        fav_test = Favorite(bg_id=bg_id, user_id=user_id)
        self.assertIsInstance(fav_test, Favorite)

    def test_user_tags_bg(self):
        bgtag_test = BgTag(bg_id=1, user_id=1, tag_id=1)
        self.assertIsInstance(bgtag_test, BgTag)





if __name__ == "__main__":
    unittest.main()