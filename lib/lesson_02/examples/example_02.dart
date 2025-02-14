// 3/4
//Xây dựng lớp Phanso gồm:
//
// Thuộc Tính: tuso, mauso.
// Phương thức:
// - Hàm Khởi Tạo đầy đủ, Hàm khởi tạo rỗng
// - Nhập , Xuất
//Tính Tổng, Hiệu, Tích, Thương của 2 phân số và rồi in kết quả ra màn hình.

//Tạo phương thức tính: tổng = tử số + mẫu số
//và in tổng này trong main

// Lưu ý: Method là 1 Function trong Class

//Viết Method in ra tổng = tử số +   1 số nhập vào bất kì (số này nhập từ bàn phím và ở hàm main)
//in ra kết quả ở trong main
import 'dart:io';

void main() {
  var phanSo = PhanSo.empty();
  phanSo.nhap();
  phanSo.xuat();
  var tong = phanSo.tong();
  print('Tong la: ${phanSo.tong()}');

  var soBatKy = int.parse(stdin.readLineSync() ?? '');
  print('Tong tu  so bat ki: ${phanSo.tongTuSoBatKy(soBatKy)}');
}

class PhanSo {
  //properties
  int? tuSo;
  int? mauSo;

  //Constructors
  PhanSo(this.tuSo, this.mauSo);

  PhanSo.empty();

  //methods
  void nhap() {
    var tuso = 5;
    print('Nhap tu so:');
    this.tuSo = int.parse(stdin.readLineSync() ?? '');
    //this là đại diện cho class. Được dùng để phân biệt với các biến hoặc hàm nằm ngoài class
    //ví dụ như tuSo của class và tuSo trong method nhap() này
    print('Nhap mau so:');
    this.mauSo = int.parse(stdin.readLineSync() ?? '');
  }

  void xuat() {
    print('Tu so la: ${this.tuSo}');
    print('\nMau so la: ${this.mauSo}');
  }

  int tong() {
    return (this.tuSo ?? 0) + (this.mauSo ?? 0);
  }

  int tongTuSoBatKy(int soBatKy) {
    return (this.tuSo ?? 0) + soBatKy;
  }
}
