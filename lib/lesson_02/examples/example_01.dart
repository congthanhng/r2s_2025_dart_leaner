/// Tổng quát

//toi muon mo ta con meo co mau mat màu nâu và màu lông màu vàng
//toi muon mô tả 1 con mèo có màu mắt màu xanh và màu lông màu xanh
//toi muon mô tả 1 con mèo có màu mắt màu tim và màu lông màu timXanh
void main() {
  Human banDuc =
      Human(name: 'Duc', age: 22, cccdTruyenVao: '1234567', speed: 10);

  print('Thong tin ban Duc: ${banDuc.name} - ${banDuc.age} - ${banDuc._cccd}');
  print(
      'Quang duong di chuyen cua DUc: ${banDuc.quangDuongDiChuyenDuoc(time: 5)}');
  banDuc.sleep();
}

class Human {
  Human(
      {required this.name,
      required this.age,
      required String cccdTruyenVao,
      required this.speed})
      : _cccd = cccdTruyenVao;

  Human.custom(
      {required this.name,
      required this.age,
      required String cccdTruyenVao,
      required this.speed})
      : _cccd = cccdTruyenVao;

  //properties
  String name;
  int age;
  String _cccd; // this property is private
  int speed;

  //Methods => hanh dong cua class
  void sleep() {
    print('Duc Dang ngu');
  }

  void walk() {}

  void eat() {}

  void speak() {}

  int quangDuongDiChuyenDuoc({required int time}) {
    return speed * time;
  }
}

int _tinhTong(int a, int b) {
  return a + b;
}
