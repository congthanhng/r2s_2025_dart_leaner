class Student {
  String name;
  bool isMale;
  double average;

  Student({
    required this.name,
    required this.isMale,
    required this.average,
  });

  ///Diem Cong
  double plus() {
    if (isMale) {
      return 1;
    }
    return 2;
  }

  // double plus() => ismale ? 1 : 2;

  ///DIEM TONG
  double diemTong() {
    return ((average * 100).round() / 100) + plus();
  }

  ///XEP LOAI
  String? xepLoai() {
    switch (diemTong()) {
      case < 5 && >= 0:
        return 'Yeu';
      case < 6.5 && >= 5:
        return 'Trung binh';
      case < 8 && >= 6.5:
        return 'Kha';
      case < 9 && >= 8:
        return 'Gioi';
      case < 10 && >= 9:
        return 'Xuat sac';
    }
    return null;
  }

  ///OUTPUT
  void output() {
    print('Hoc sinh $name dat loai: ${xepLoai()}');
  }
}
