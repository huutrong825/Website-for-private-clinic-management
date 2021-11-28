from flask_admin.contrib.sqla import  ModelView
from app import db, admin
from app.models import *
from flask_admin import BaseView,expose
from flask_login import current_user,logout_user
from flask import redirect

class AuthenticatedView(ModelView):
    column_display_pk = False

    def is_accessible(self):
        return current_user.is_authenticated


class PhieuKhamView(AuthenticatedView):
    column_display_all_relations = True

class ContactView(BaseView):
    @expose('/')
    def index(self):
        return self.render('admin/contact.html')

    def is_accessible(self):
        return current_user.is_authenticated

class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()

        return redirect('/admin')
    def is_accessible(self):
        return current_user.is_authenticated



admin.add_view(AuthenticatedView(BenhNhan,db.session))
admin.add_view(PhieuKhamView(PhieuKham,db.session))
admin.add_view(AuthenticatedView(DonThuoc,db.session))
admin.add_view(AuthenticatedView(HoaDon,db.session))
admin.add_view(AuthenticatedView(Thuoc,db.session))
admin.add_view(AuthenticatedView(LoaiThuoc,db.session))
admin.add_view(AuthenticatedView(Benh,db.session))
admin.add_view(AuthenticatedView(NhanVien,db.session))
admin.add_view(ContactView(name='About'))
admin.add_view(LogoutView(name='Logout'))