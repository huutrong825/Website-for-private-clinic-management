import hashlib
from app.models import *
from app import db
from sqlalchemy import or_,func

#thêm user
def register_user(name, email, username, password):
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    u = User(name=name,
             email=email,
             username=username,
             password=password)
    try:
        db.session.add(u)
        db.session.commit()
        return True
    except:
        return False

#tìm kiếm BN
def find_BenhNhan(name=None, ngay_sinh=None):
    benhnhan = BenhNhan.query

    if name:
        benhnhan = benhnhan.filter(BenhNhan.name.contains(name))
    if ngay_sinh:
        benhnhan = benhnhan.filter(BenhNhan.ngaySinh.contains(ngay_sinh))

    return benhnhan.all()

#tìm thuốc
def find_medic(text=None):
    thuoc = Thuoc.query.join(LoaiThuoc,Thuoc.loaiThuoc_id == LoaiThuoc.id)

    if text:
        thuoc = thuoc.filter(or_(LoaiThuoc.loai.contains(text),Thuoc.tenThuoc.contains(text)))

    return thuoc.all()



def ds_KhamBenh(ngay_kham=None):
    ds = BenhNhan.query.join(PhieuKham,PhieuKham.benhnhan_id == BenhNhan.id)
    if ngay_kham:
     ds=ds.filter(PhieuKham.ngayKham.contains(ngay_kham)).add_columns(PhieuKham.chanDoan)
    return ds.all()


#hoadon
def bill():
   pass

#thêm bệnh nhân
def them_BN(maBN,name, sex, ngaysinh, phone, address,ngayLap,chieu_cao,can_nang,huyet_ap):
    bn = BenhNhan(maBN=maBN,name=name, sex=sex, ngaySinh=ngaysinh, phone=phone, diaChi=address,canNang=can_nang,chieuCao=chieu_cao,huyetAp=huyet_ap,\
                  ngaykham=ngayLap)

    try:
        db.session.add(bn)
        db.session.commit()
        return True
    except:
        return False


#kê toa thuốc
def PK_DT(MaBN,name,maPk,maDT,trieu_chung,chan_doan,ten_thuoc,so_luong,don_vi,cach_dung,bac_si):

    benhnhan_id=BenhNhan.query.filter(BenhNhan.maBN.contains(MaBN) & BenhNhan.name.contains(name)).first()

    nhanvien_id=NhanVien.query.filter(NhanVien.name.contains(bac_si)).first()

    thuoc=Thuoc.query.filter(Thuoc.tenThuoc.contains(ten_thuoc)).first()


    pk=PhieuKham(maPK=maPk,trieuChung=trieu_chung,chanDoan=chan_doan,benhnhan_id=benhnhan_id,nhanvien_id=nhanvien_id)

    dt=DonThuoc(maDon=maDT,soluong=so_luong,donVi=don_vi,cachdung=cach_dung,benhnhan_id=benhnhan_id,nhanvien_id=nhanvien_id,mathuoc=thuoc)

    try:
        db.session.add(pk)
        db.session.add(dt)
        db.session.commit()
        return True
    except:
        return False

def them_thuoc(tenthuoc,dongia,soluong,donvi,loai):

    loai=LoaiThuoc.query.filter(LoaiThuoc.loai.contains(loai))

    t=Thuoc(tenThuoc=tenthuoc,donGia=dongia,soLuong=soluong,donViTinh=donvi,loaiThuoc_id=loai)

    try:
        db.session.add(t)
        db.session.commit()
        return True
    except:
        return False

def loai_thuoc():

    return LoaiThuoc.query.all()

def doanhthu(fromdate,todate):

    t=BenhNhan.query.join(PhieuKham,PhieuKham.benhnhan_id == BenhNhan.id).join(HoaDon,PhieuKham.id == HoaDon.phieukham_id)

    soBN=t.query(func.count(BenhNhan.id)).group_by(BenhNhan.id)

    dt=DoanhThu.query.all()


    dt=DoanhThu()

    pass

