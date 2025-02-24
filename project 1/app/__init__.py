import os

from flask import Flask
from app.routes.home import home_bp
from app.routes.movies import movies_bp
from app.routes.actors import actors_bp
from app.routes.queries import queries_bp

BASE_DIR = os.path.abspath(os.path.dirname(__file__))
STATIC_DIR = os.path.join(BASE_DIR, "../static")
app = Flask(__name__, static_folder=STATIC_DIR, template_folder="../templates")

app.register_blueprint(home_bp)
app.register_blueprint(movies_bp, url_prefix="/movies")
app.register_blueprint(actors_bp, url_prefix="/actors")
app.register_blueprint(queries_bp, url_prefix="/query")
