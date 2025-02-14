//Tinh chu vi, dien tich cua mot hinh tam giac, hinh tron và hinh chu nhat bat ki
//Cac Hình đều có 1 property private là Màu Sắc, viết hàm getter và setter cho property private đó

import 'dart:math';

void main() {
  // final tamGiac = TamGiac(a: 1, b: 2, c: 3);
  // final tron = Tron(r: 10);
  // final chuNhat = ChuNhat(d: 2, r: 5);
  // tamGiac.output();
  // tron.output();
  // chuNhat.output();

  final tamGiac1 = TamGiac(a: 1, b: 2, c: 3);
  final tamGiac2 = TamGiac(a: 4, b: 5, c: 6);
  print('truoc khi thay doi: ${TamGiac.scaleName}');
  tamGiac1.output();
  tamGiac2.output();
  TamGiac.changeValueOfScale();
  print('Sau khi thay doi sang: ${TamGiac.scaleName}');
  tamGiac1.output();
  tamGiac2.output();
}

abstract class Shape {
  String? _color;

  set color(String value) => _color = value;

  String get color => _color ?? 'Trang';

  double tinhChuVi();

  double tinhDienTich();

  void output() {
    print('TOi la mot hinh hoc');
  }
}

class TamGiac extends Shape {
  final double a;
  final double b;
  final double c;

  TamGiac({required this.a, required this.b, required this.c});

  static String scaleName = 'ABCDEF';

  static void changeValueOfScale() {
    scaleName = 'GHUKLNMN';
  }

  @override
  double tinhChuVi() {
    return a + b + c;
  }

  @override
  double tinhDienTich() {
    return a * b * c;
  }

  @override
  void output() {
    print('TOi la mot Hinh Tam giac: $scaleName');
  }
}

class Tron extends Shape {
  final double r;

  Tron({required this.r});

  @override
  double tinhChuVi() => 2 * pi * r;

  @override
  double tinhDienTich() => 2 * pi * pow(r, 2);
}

class ChuNhat extends Shape {
  final double d;
  final double r;

  ChuNhat({required this.d, required this.r});

  @override
  double tinhChuVi() => 2 + (d + r);

  @override
  double tinhDienTich() => d * r;
}
