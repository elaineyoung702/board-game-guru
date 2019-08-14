from flask import Flask
# from flask_debugtoolbar import DebugToolbarExtension
# from jinja2 import StrictUndefined
from model import connect_to_db, db

app = Flask(__name__)

app.secret_key = "s00persekret"

# app.jinja_env.undefinted = StrictUndefined

@app.route('/')
def index():
    """Homepage."""

    return "<html><body>Placeholder</body></html>"




if __name__ == "__main__":
    app.debug = True
    # app.jijna_env.auto_reload = app.debug

    connect_to_db(app)

    # DebugToolbarExtension(app)

    app.run(port=5000, host="0.0.0.0")