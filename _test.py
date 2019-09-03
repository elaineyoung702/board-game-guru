import unittest

from server import app
from model import db, connect_to_db, example_data


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
        print("idk man")
        db.session.close()
        db.drop_all()


    def test_db_page(self):
        result = self.client.get("/database")
        self.assertIn(b"Column Headers", result.data)



if __name__ == "__main__":
    unittest.main()