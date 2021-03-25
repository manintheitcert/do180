from flask import Flask
from flask import render_template


app = Flask(__name__)
#app.config.from_object('config.py')

@app.route("/")
def hello_world():
    return render_template("index.html")
