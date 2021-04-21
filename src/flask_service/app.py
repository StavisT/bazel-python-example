from flask import Flask
from werkzeug.middleware.proxy_fix import ProxyFix

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)

@app.route("/")
def home():
  return "Welcome to this empty home page"

@app.route("/health/<string:check>", methods=["GET"])
def health(check):
    return {check: "good"}
