void main() async {
  await layThongTinTuServer();
  print('6. Xong tat ca');
}

Future<void> layThongTinTuServer() async {
  print('1.Hien thi loading');

  await Future.delayed(Duration(seconds: 2)).then(
    (value) {
      print('2.Toi lay du lieu thanh cong');
    },
  );

  print('3.Lay THong tin thanh cong');
  print('4.In va tra ve ket qua');
}
