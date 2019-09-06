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

    def test_user_query(self):
        user = User.query.get(1)
        self.assertEqual(user.name, "Jack")
        self.assertEqual(user.email, "jack@test.com")
        self.assertEqual(user.password, "test")

    def test_bg_query(self):
        bg = BoardGame.query.get(9000)
        self.assertEqual(bg.bg_name, "Pandemic Legacy, Season 1")

    def test_user_favorites(self):
        user = User.query.get(2)
        [faves] = user.favorites
        self.assertIs(faves, BoardGame.query.filter(BoardGame.bg_id==9000).one())
        self.assertIn("Pandemic", faves.bg_name)

    def test_user_bg_tags(self):
        user = User.query.get(1)
        [tag1, tag2] = user.bg_tags
        self.assertIn("Classic", tag1.tag_name)
        self.assertIs(3, tag2.tag_id)


    def test_get_tags_by_bg_method(self):
        user = User.query.get(2)
        [tag1, tag2] = user.get_tags_by_bg(9000)
        self.assertIn("Cooperative", tag1.tag_name)
        self.assertIn("Legacy", tag2.tag_name)

    def test_get_user_favs_method(self):
        user = User.query.get(1)
        fav_bg_id = user.get_user_favs()
        self.assertIn(9000, fav_bg_id)







if __name__ == "__main__":
    unittest.main()