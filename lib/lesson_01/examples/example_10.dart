///Control Flow: Loop
///For-loop, for-in, while-do, do-while
///break, continue

void main() {
  ///For cơ bản
  //Nhập vào 1 số nguyên n
  //in ra các số từ 0 tới n;

  // print('Nhap vao so nguyen N:');
  // var n = int.parse(stdin.readLineSync() ?? '');
  //
  // for (int i = 0; i < n; i++) {
  //   print('$i ');
  // }

  /// For-In
  //Cho 1 mảng ['Cong','Huy','NhatHau','Khanh',]
  //in các phần tử trong mảng;
  List list = [
    'Cong',
    'Duc',
    'Anh',
    'Cuong',
  ];
  // for (String name in list) {
  //   print(name);
  // }
  //
  // for (int i = 0; i < list.length ; i++) {
  //   // if(i == 1) continue;
  //   print('${list[i]}');
  //   if(i == 2) break;
  //
  // }

  int i = 0;
  while (i < list.length) {
    // if(i == 1) continue;
    print('${list[i]}');
    i++;
  }

  do {
    print('${list[i]}');
    i++;
  } while (i == 10);
}
