#!/usr/bin/python3
"""Script starts a Flask web application"""
from models import storage
from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route('/cities_by_states', strict_slashes=False)
def cities_by_states():
    """Displays an HTML page with a list"""

    states = storage.all("State")
    return render_template("8-cities_by_states.html", states=states)


@app.teardown_appcontext
def teardown(exc):
    """Removes the current SQLAlchemy session"""
    storage.close()


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
