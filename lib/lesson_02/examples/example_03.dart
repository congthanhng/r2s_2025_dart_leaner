///Kế thừa
//extend and implement
void main() {
  DongVat conGaVang = Ga(12, 5, 'Vang');
  Cho conChoXanh = Cho(20, 25, 'Xanh');
  DongVat conMeoTim = Meo(15, 20, 'Tim');

  print(
      'Con ga Vang: ${conGaVang.chieuCao} - ${conGaVang.mauLong} - ${conGaVang.canNang}');
  print(
      'Con Cho Xanh: ${conChoXanh.chieuCao} - ${conChoXanh.mauLong} - ${conChoXanh.canNang}');
  print(
      'Con Meo Tim: ${conMeoTim.chieuCao} - ${conMeoTim.mauLong} - ${conMeoTim.canNang}');

  print('Con ga: ${conGaVang.runtimeType}');
  print('Con cho: ${conChoXanh.runtimeType}');
  print('Con Meo: ${conMeoTim.runtimeType}');

  if (conGaVang is DongVat) {
    print('Con ga dung la Dong Vat');
  }

  if (conChoXanh is DongVat) {
    print('Con cho dung la Dong Vat');
  }

  if (conMeoTim is DongVat) {
    print('Con meo dung la Dong Vat');
  }

  conGaVang.chay();
  conChoXanh.chay();
  conMeoTim.chay();
}

abstract class DongVat {
  int chieuCao;
  int canNang;
  String mauLong;

  DongVat(this.chieuCao, this.canNang, this.mauLong);

  //methods
  void chay() {}
}

class Cho extends DongVat {
//Constructor
  Cho(super.chieuCao, super.canNang, super.mauLong);

  // int _mauDuoi;

  @override
  void chay() {
    print('Cho chay bang 4 chan');
  }

  void _sua() {}
}

class Meo extends DongVat {
  Meo(super.chieuCao, super.canNang, super.mauLong);

  @override
  void chay() {
    print('Meo chay bang 4 chan');
  }
}

class Ga extends DongVat {
  Ga(super.chieuCao, super.canNang, super.mauLong);

  @override
  void chay() {
    print('Ga chay bang 2 chan');
  }
}
