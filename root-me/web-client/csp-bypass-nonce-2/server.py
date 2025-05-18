import flask

app = flask.Flask(__name__)

@app.route('/web-client/ch62/<path:filename>')
def serve_static_file(filename):
  return flask.send_from_directory('static', filename)

app.run(port=4444)