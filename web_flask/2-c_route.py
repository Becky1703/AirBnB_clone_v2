#!/usr/bin/python3
"""Script starts a Flask web application"""
from flask import Flask, request
from markupsafe import escape

app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_hbnb():
    """Displays Hello HBNB!"""
    name = request.args.get("name", "HBNB")
    return f'Hello {escape(name)}!'

@app.route('/hbnb', strict_slashes=False)
def hbnb():
    """Displays HBNB"""
    return 'HBNB'

@app.route('/c/<text>', strict_slashes=False)
def c(text):
    """Displays C and any text used as variable in the route"""
    text = text.replace("_", " ")
    return "C {}".format(text)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
