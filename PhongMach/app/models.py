from sqlalchemy import Column, Integer, String, ForeignKey, Date, Boolean,Enum,Float
from sqlalchemy.orm import relationship, backref
from app import db
from datetime import date
from flask_login import UserMixin, current_user
from enum import Enum as UserEnum



class BenhNhan(db.Model):
    __tablename__ = 'BenhNhan'
    id = Column(Integer, primary_key=True, autoincrement=True)
    maBN=Column(String(50))
    name = Column(String(50), nullable=False)
    sex = Column(String(5))
    ngaySinh = Column(Date)
    diaChi = Column(String(100))
    phone = Column(String(20))
    canNang=Column(Float)
    chieuCao=Column(Float)
    huyetAp=Column(Float)
    ngaykham=Column(Date,default=date.today())

    phieuKham = relationship('PhieuKham', backref='benhnhan', lazy=True)
    donThuoc = relationship('DonThuoc', backref='benhnhan', lazy=True)

    def __str__(self):
        return self.name
    
class UserRole(UserEnum):
    USER=1
    ADMIN=2

class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True,autoincrement=True)
    name = Column(String(50), nullable=False)
    active = Column(Boolean, default=True)
    username = Column(String(50), nullable=False,unique=True)
    password = Column(String(50), nullable=True)
    email=Column(String(50))
    avatar=Column(String(100))
    userRole=Column(Enum(UserRole),default=UserRole.USER)

    nhanvien = relationship('NhanVien', uselist=False, back_populates='user')
    def __str__(self):
        return self.username
    
class NhanVien(db.Model):
    __tablename_ = 'NhanVien'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    sex = Column(String(5))
    ngaySinh = Column(Date)
    diaChi = Column(String(100))
    phone = Column(String(20))
    nghiepVu = Column(String(20))
    chuyenMon=Column(String(50))

    User_id = Column(Integer, ForeignKey(User.id))
    user = relationship("User", back_populates="nhanvien",lazy=True)
    donthuoc = relationship('DonThuoc', backref='bacsi', lazy=True)
    phieuKham = relationship('PhieuKham', backref='bacsi', lazy=True)

    def __str__(self):
        return self.name

class Benh(db.Model):
    id=Column(Integer,primary_key=True,autoincrement=True)
    tenBenh=Column(String(50))

    loaiThuoc = relationship('LoaiThuoc', backref='benh', lazy=True)

    def __str__(self):
        return self.tenBenh

class LoaiThuoc(db.Model):
    id=Column(Integer,primary_key=True,autoincrement=True)
    loai=Column(String(50),nullable=False)

    thuoc = relationship('Thuoc',backref='loaithuoc', lazy=True)
    benh_id = Column(Integer, ForeignKey(Benh.id))

    def __str__(self):
        return self.loai

class Thuoc(db.Model):
    __tablename__ = 'Thuoc'
    id = Column(Integer, primary_key=True, autoincrement=True)
    tenThuoc = Column(String(70))
    donGia = Column(Float)
    soLuong = Column(Integer,default=0)
    donViTinh = Column(String(5))

    loaiThuoc_id = Column(Integer, ForeignKey(LoaiThuoc.id),nullable=False)

    def __str__(self):
        return self.tenThuoc


class PhieuKham(db.Model):
    __tablename__ = 'PhieuKham'
    id = Column(Integer, primary_key=True, autoincrement=True)
    maPK=Column(String(50))
    stt = Column(Integer, autoincrement=True)
    ngayKham = Column(Date,default=date.today())
    trieuChung = Column(String(100))
    chanDoan = Column(String(200))

    benhnhan_id = Column(Integer, ForeignKey(BenhNhan.id), nullable=False)
    hoaDon = relationship('HoaDon', backref='phieukham', lazy=True)
    nhanvien_id = Column(Integer, ForeignKey(NhanVien.id))

    def __str__(self):
        return self.maPK

class HoaDon(db.Model):
    __tablename__ = 'HoaDon'
    id = Column(Integer, primary_key=True, autoincrement=True)
    maHD=Column(String(50))
    ngaylap=Column(Date)
    tienKham = Column(Float,default=30000)

    phieukham_id = Column(Integer, ForeignKey(PhieuKham.id), nullable=False)
    donThuoc = relationship('DonThuoc', backref='hoa_don', lazy=True)

    def __str__(self):
        return self.maHD

class DonThuoc(db.Model):
    __tablename__ = 'DonThuoc'
    id = Column(Integer, primary_key=True, autoincrement=True)
    maDon = Column(String(50))
    soluong=Column(Integer)
    donVi=Column(String(20))
    cachdung=Column(String(100))

    benhnhan_id = Column(Integer, ForeignKey(BenhNhan.id), nullable=False)
    hoadon_id = Column(Integer, ForeignKey(HoaDon.id))
    nhanvien_id = Column(Integer, ForeignKey(NhanVien.id))
    mathuoc=relationship('Thuoc',secondary='chitiet_donthuoc',lazy='subquery',backref=backref('donthuoc',lazy=True))

    def __str__(self):
        return self.maDon

chitiet_donthuoc=db.Table('chitiet_donthuoc',Column('donthuoc_id',Integer,ForeignKey(DonThuoc.id),primary_key=True),
                          Column('thuoc_id',Integer,ForeignKey(Thuoc.id),primary_key=True),\
                          Column('soluong',Integer,default=DonThuoc.soluong),Column('donvi',String(20),default=DonThuoc.donVi),
                     Column('cachdung',String(100),default=DonThuoc.cachdung),Column('dongia',Float,default=Thuoc.donGia ))

class ds_BN(db.Model):
    benhnhan_id=Column(Integer,primary_key=True)
    chandoan=Column(String(100))
    dieutri=Column(String(200))

class DoanhThu(db.Model):
    id=Column(Integer,primary_key=True,autoincrement=True)
    ngay=Column(Date)
    countBN=Column(Integer,default=0)
    doanhThu=Column(Float,default=0)
    ti_le=Column(Float,default=0)

class SuDungThuoc(db.Model):
    id=Column(Integer,primary_key=True,autoincrement=True)
    thuoc=Column(String(50))
    donVi=Column(String(10))
    so_luong=Column(Integer,default=0)
    so_lan_dung=Column(Integer,default=0)

if __name__ == '__main__':
    db.create_all()
