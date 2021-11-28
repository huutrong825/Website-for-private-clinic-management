from flask import render_template, redirect, request, session, url_for
from flask_login import login_user,login_required
from app import app, login ,utils
from app.admin import *
from app.models import *
import hashlib,os

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/BenhNhan')
def BenhNhan():
    err = ''
    name = request.args.get('name')
    ngay_sinh = request.args.get('Birth')
    benhnhan = utils.find_BenhNhan(name=name, ngay_sinh=ngay_sinh)

    return render_template('BenhNhan.html',benhnhan=benhnhan,err=err)

@app.route('/DonThuoc',methods=['get','post'])
def DonThuoc():
    err_msg = ''
    if request.method == 'POST':
        maBN = request.form.get('maBN')
        name = request.form.get('name')
        maPK = request.form.get('maPK')
        maDT = request.form.get('maDT')
        trieu_chung = request.form.get('trieuchung')
        chan_doan = request.form.get('chandoan')
        ten_thuoc = request.form.get('tenthuoc')
        so_luong = request.form.get('soluong')
        don_vi = request.form.get('donvi')
        cach_dung = request.form.get('cachdung')
        bac_si = request.form.get('bacsi')
        if (utils.PK_DT(MaBN=maBN, name=name, maPk=maPK, maDT=maDT, trieu_chung=trieu_chung, chan_doan=chan_doan,\
                       ten_thuoc=ten_thuoc,so_luong=so_luong, don_vi=don_vi, cach_dung=cach_dung, bac_si=bac_si)):
            err_msg = 'Thêm thành công'

    return render_template('DonThuoc.html',err_msg=err_msg)

@app.route('/HoaDon')
def HoaDon():

    return render_template('HoaDon.html')

@app.route('/Thuoc')
def Thuoc():
    text=request.args.get('tenthuoc')
    thuoc = utils.find_medic(text=text)

    return render_template('Thuoc.html',thuoc=thuoc)

@app.route('/BaoCao')
def BaoCao():
    return render_template('BaoCao.html')


#trang đăng nhập
@app.route('/login_admin', methods=['GET','POST'])
def login_admin():
    if request.method=='POST':
        username=request.form.get('username')
        password=request.form.get('password')
        password=str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
        user=User.query.filter(User.username==username.strip(),User.password==password).first()
        if user:
            login_user(user=user)
            return redirect('/')

    return redirect('/admin')


@login.user_loader
def load_user(user_id):
    return User.query.get(user_id)

#ĐĂng kí
@app.route('/Signup',methods=['GET','POST'])
def SignUp():
    err_msg=''
    if request.method == 'POST':
        password = request.form.get('password')
        confirm = request.form.get('confirm')
        if password == confirm:
            name = request.form.get('name')
            email = request.form.get('email')
            username = request.form.get('username')
            if utils.register_user(name=name, username=username, password=password,email=email):
                return redirect('/admin')
            else:
                err_msg = "Hệ thống đang bị lỗi! Vui lòng thực hiện sau!"
        else:
            err_msg = "Mật khâu không khớp!"

    return render_template('SignUp.html', err_msg=err_msg)

#them benh nhan moi
@app.route('/Add',methods=['GET','POST'])
def Them():
    err_msg=''
    if request.method == 'POST':
        maBN=request.form.get('MaBN')
        name = request.form.get('name')
        sex = request.form.get('sex')
        ngaysinh = request.form.get('ngaysinh')
        phone=request.form.get('phone')
        address=request.form.get('address')
        can_nang=request.form.get('cannang')
        chieu_cao=request.form.get('chieucao')
        huyet_ap=request.form.get('huyetap')
        ngaylap=request.form.get('ngaylap')
        if utils.them_BN(maBN=maBN,name=name, sex=sex, ngaysinh=ngaysinh,phone=phone,address=address,chieu_cao=chieu_cao,\
                         can_nang=can_nang,huyet_ap=huyet_ap,ngayLap=ngaylap):
            return redirect('/BenhNhan')
        else:
            err_msg = "Hệ thống đang bị lỗi! Vui lòng thực hiện sau!"

    return render_template('themBN.html', err_msg=err_msg)


@app.route('/dskham')
def ds_kham():
    ngay_kham=request.form.get('ngay_kham')
    ds=utils.ds_KhamBenh(ngay_kham=ngay_kham)

    return render_template('DS Kham Benh.html',ds=ds)


if __name__=='__main__':
    app.run(debug=True)