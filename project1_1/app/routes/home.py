from flask import Blueprint, render_template
from app.database import Database

home_bp = Blueprint("home", __name__)


@home_bp.route("/")
def index():
    """Homepage displaying a list of movies."""

    # ============================ README ===============================
    #    This is an *example function* demonstrating how to retrieve 
    #    all motion pictures (ID and Name) from the `MotionPicture` 
    #    table and pass them to  the frontend for rendering.
    #
    #    The retrieved movies are displayed in a dropdown menu on the homepage.

    # Implementation Steps:
    #    - Open a database connection using the `Database` context manager.
    #    - Execute the SQL query to retrieve movie data.
    #    - Pass the retrieved list to `index.html` for rendering.
    # ===================================================================
    #
    # >>>> No changes are expected in this function <<<<

    query = """SELECT id, name FROM MotionPicture;"""

    with Database() as db:
        movies = db.execute(query=query)
    return render_template("index.html", movies=movies)
