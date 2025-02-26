from flask import Blueprint, render_template, request
from app.database import Database

queries_bp = Blueprint("query", __name__)
