from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager

app=Flask(__name__)
app.secret_key='\x82\x89q\xac\x9f\xb0Z\\\xe2\xdc\x88\xa7\xfd\xc4\xe2\xd1'
app.config["SQLALCHEMY_DATABASE_URI"] ="mysql+pymysql://root:Huutrong825@@localhost/phongkhamdb?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True


db=SQLAlchemy(app=app)

admin=Admin(app=app,name='Phòng Mạch',template_mode='bootstrap4')

login=LoginManager(app=app)


def decorator():
    return None