import 'dart:io';

abstract class HoaDon {
  String maKH;
  String tenKH;
  int soLuong;
  double giaBan;

  HoaDon({
    this.maKH = '',
    this.tenKH = '',
    this.soLuong = 0,
    this.giaBan = 0,
  });

  HoaDon.full(this.maKH, this.tenKH, this.soLuong, this.giaBan);

  void nhap() {
    while (true) {
      stdout.write("Nhập mã KH (KHxxxx): ");
      maKH = stdin.readLineSync()!;
      if (RegExp(r'^KH\d{4}$').hasMatch(maKH)) break;
      print("❌ Sai định dạng mã khách hàng");
    }

    do {
      stdout.write("Nhập tên KH: ");
      tenKH = stdin.readLineSync()!;
    } while (tenKH.isEmpty);

    do {
      stdout.write("Nhập số lượng: ");
      soLuong = int.parse(stdin.readLineSync()!);
    } while (soLuong <= 0);

    do {
      stdout.write("Nhập giá bán: ");
      giaBan = double.parse(stdin.readLineSync()!);
    } while (giaBan <= 0);
  }

  double tinhVAT() => soLuong * giaBan * 0.1;

  double tinhChietKhau();

  double tinhTroGia();

  double thanhTien() {
    return soLuong * giaBan - tinhChietKhau() + tinhVAT() - tinhTroGia();
  }

  void xuat() {
    print(
        "Mã KH: $maKH | Tên: $tenKH | SL: $soLuong | Giá: $giaBan | Thành tiền: ${thanhTien()} | Trợ giá: ${tinhTroGia()}");
  }
}
class HoaDonCaNhan extends HoaDon {
  double khoangCach;

  HoaDonCaNhan({this.khoangCach = 0});

  @override
  void nhap() {
    super.nhap();
    stdout.write("Nhập khoảng cách giao hàng (km): ");
    khoangCach = double.parse(stdin.readLineSync()!);
  }

  @override
  double tinhChietKhau() {
    double ck = 0;
    if (soLuong >= 3) {
      ck = soLuong * giaBan * 0.05;
    }
    if (khoangCach < 10) {
      ck += soLuong * 50000;
    }
    return ck;
  }

  @override
  double tinhTroGia() {
    double tg = soLuong * giaBan * 0.02;
    if (soLuong > 2) tg += 100000;
    return tg;
  }
}
class HoaDonDaiLyCap1 extends HoaDon {
  int thoiGianHopTac;

  HoaDonDaiLyCap1({this.thoiGianHopTac = 0});

  @override
  void nhap() {
    super.nhap();
    stdout.write("Nhập số năm hợp tác: ");
    thoiGianHopTac = int.parse(stdin.readLineSync()!);
  }

  @override
  double tinhChietKhau() {
    double tyLe = 0.3;
    if (thoiGianHopTac > 5) {
      tyLe += (thoiGianHopTac - 5) * 0.01;
      if (tyLe > 0.35) tyLe = 0.35;
    }
    return soLuong * giaBan * tyLe;
  }

  @override
  double tinhTroGia() => 0;
}
class HoaDonCongTy extends HoaDon {
  int soNhanVien;

  HoaDonCongTy({this.soNhanVien = 0});

  @override
  void nhap() {
    super.nhap();
    stdout.write("Nhập số lượng nhân viên: ");
    soNhanVien = int.parse(stdin.readLineSync()!);
  }

  @override
  double tinhChietKhau() {
    if (soNhanVien > 5000) return soLuong * giaBan * 0.07;
    if (soNhanVien > 1000) return soLuong * giaBan * 0.05;
    return 0;
  }

  @override
  double tinhTroGia() {
    return soLuong * 120000;
  }
}
class QuanLyHoaDon {
  List<HoaDon> ds = [];

  void nhapDS() {
    stdout.write("Nhập số hóa đơn: ");
    int n = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < n; i++) {
      print("1.Cá nhân  2.Đại lý cấp 1  3.Công ty");
      int loai = int.parse(stdin.readLineSync()!);
      HoaDon hd;
      if (loai == 1) hd = HoaDonCaNhan();
      else if (loai == 2) hd = HoaDonDaiLyCap1();
      else hd = HoaDonCongTy();

      hd.nhap();
      ds.add(hd);
    }
  }

  void xuatDS() => ds.forEach((e) => e.xuat());

  double tongThanhTien() =>
      ds.fold(0, (sum, e) => sum + e.thanhTien());

  double tongTroGia() =>
      ds.fold(0, (sum, e) => sum + e.tinhTroGia());

  HoaDon? maxSoLuong() =>
      ds.reduce((a, b) => a.soLuong > b.soLuong ? a : b);

  double tongChietKhauCongTy() {
    return ds
        .where((e) => e is HoaDonCongTy)
        .fold(0, (sum, e) => sum + e.tinhChietKhau());
  }

  void sapXep() {
    ds.sort((a, b) {
      if (a.soLuong != b.soLuong) {
        return a.soLuong.compareTo(b.soLuong);
      }
      return b.thanhTien().compareTo(a.thanhTien());
    });
  }

  void timTheoMa(String ma) {
    var kq = ds.where((e) => e.maKH == ma).toList();
    if (kq.isEmpty)
      print("Khách hàng lạ");
    else
      kq.forEach((e) => e.xuat());
  }
}
void main() {
  QuanLyHoaDon ql = QuanLyHoaDon();
  ql.nhapDS();
  ql.xuatDS();

  print("Tổng thành tiền: ${ql.tongThanhTien()}");
  print("Tổng trợ giá: ${ql.tongTroGia()}");

  print("KH mua nhiều nhất:");
  ql.maxSoLuong()?.xuat();

  print("Tổng chiết khấu KH công ty: ${ql.tongChietKhauCongTy()}");

  ql.sapXep();
  print("Danh sách sau sắp xếp:");
  ql.xuatDS();

  stdout.write("Nhập mã KH cần tìm: ");
  ql.timTheoMa(stdin.readLineSync()!);
}
