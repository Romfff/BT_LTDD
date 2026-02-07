import 'dart:io';
import 'dart:math';
void bai1() {
  print("Nhập số que kem (>0): ");
  int soQue = int.parse(stdin.readLineSync()!);

  print("Nhập giá 1 que kem: ");
  double gia = double.parse(stdin.readLineSync()!);

  double tongTien = soQue * gia;

  if (soQue > 10) {
    tongTien *= 0.9; 
  } else if (soQue >= 5) {
    tongTien *= 0.95; 
  }

  print("Số tiền phải trả: $tongTien");
}
void bai2() {
  print("Nhập số nguyên dương > 10: ");
  int n = int.parse(stdin.readLineSync()!);

  String s = n.toString();


  print("Số chữ số: ${s.length}");


  int tong = 0;
  for (var c in s.split('')) {
    tong += int.parse(c);
  }
  print("Tổng các chữ số: $tong");


  bool coSoLe = false;
  for (var c in s.split('')) {
    if (int.parse(c) % 2 != 0) {
      coSoLe = true;
      break;
    }
  }
  print(coSoLe
      ? "Số có chứa chữ số lẻ"
      : "Số không chứa chữ số lẻ");
}
bool laSoNguyenTo(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void bai3() {
  print("Nhập số lượng phần tử: ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> ds = [];
  for (int i = 0; i < n; i++) {
    print("Nhập phần tử thứ ${i + 1}: ");
    ds.add(int.parse(stdin.readLineSync()!));
  }


  print("Danh sách: $ds");


  int tong = ds.reduce((a, b) => a + b);
  print("Tổng các phần tử: $tong");


  print("Các số nguyên tố:");
  for (var x in ds) {
    if (laSoNguyenTo(x)) print(x);
  }


  print("Nhập giá trị cần tìm: ");
  int x = int.parse(stdin.readLineSync()!);

  if (ds.contains(x)) {
    print("Giá trị $x ở vị trí ${ds.indexOf(x)}");
  } else {
    ds.insert(0, x);
    print("Không có, đã thêm $x vào đầu danh sách");
    print("Danh sách mới: $ds");
  }
}
void baiTapVeNha1() {
  Random rd = Random();
  List<int> ds =
      List.generate(10, (_) => rd.nextInt(96) + 5);

  // a
  print("Danh sách: $ds");

  // b
  var soLe = ds.where((x) => x % 2 != 0).toList();
  if (soLe.isEmpty) {
    print("Danh sách không có số lẻ");
  } else {
    double tb =
        soLe.reduce((a, b) => a + b) / soLe.length;
    print("Trung bình cộng số lẻ: $tb");
  }

  // c
  bool doiXung = true;
  for (int i = 0; i < ds.length ~/ 2; i++) {
    if (ds[i] != ds[ds.length - i - 1]) {
      doiXung = false;
      break;
    }
  }
  print(doiXung
      ? "Danh sách đối xứng"
      : "Danh sách không đối xứng");

  // d
  bool tangDan = true;
  for (int i = 0; i < ds.length - 1; i++) {
    if (ds[i] > ds[i + 1]) {
      tangDan = false;
      break;
    }
  }
  print(tangDan
      ? "Danh sách tăng dần"
      : "Danh sách không tăng dần");

  // e
  print("Phần tử lớn nhất: ${ds.reduce(max)}");

  // f
  var soChan = ds.where((x) => x % 2 == 0).toList();
  if (soChan.isEmpty) {
    print("Danh sách không có số chẵn");
  } else {
    print("Số chẵn lớn nhất: ${soChan.reduce(max)}");
  }

  // g
  print("Nhập giá trị cần tìm: ");
  int x = int.parse(stdin.readLineSync()!);

  if (!ds.contains(x)) {
    print("Không tìm thấy");
  } else {
    ds.removeWhere((e) => e == x);
    print("Danh sách sau khi xóa: $ds");
  }
}
void baiTapVeNha2() {
  print("Nhập chuỗi: ");
  String s = stdin.readLineSync()!;

  // a
  print("Chuỗi: $s");

  // b
  String nguyenAm = "aeiouAEIOUáàảãạăâêôơưíì";
  int dem = 0;
  for (var c in s.split('')) {
    if (nguyenAm.contains(c)) dem++;
  }
  print("Số ký tự nguyên âm: $dem");

  // c
  print("Số từ: ${s.trim().split(RegExp(r'\s+')).length}");

  // d
  String dao = s.split('').reversed.join();
  print(dao == s
      ? "Chuỗi đối xứng"
      : "Chuỗi không đối xứng");

  // e
  print("Chuỗi đảo từ: ${s.split(' ').reversed.join(' ')}");
}

void main() {
  bai1();
  bai2();
  bai3();
  baiTapVeNha1();
  baiTapVeNha2();
}
