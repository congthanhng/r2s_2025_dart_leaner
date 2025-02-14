import 'dart:io';

///Control Flow: Branch và Loop

///Branch
///If-Else, Switch-case,
///Conditional expressions:
/// condition ? expr1 : expr2
/// expr1 ?? expr2

void main() {
  ///If-else
  print('Nhap vao chieu cao cua ban:');
  var height = int.parse(stdin.readLineSync() ?? '');

  //cách 1
  // if (height < 130) {
  //   print('Ban duoc mien phi vao cong');
  // } if(height == 130){
  //   print('Ban duoc mien phi vao cong');
  // } else {
  //   // height >= 130
  //   print('Ban phai mua ve truoc khi vao cong');
  // }

  switch (height) {
    case < 130:
    case == 130:
      print('Ban duoc mien phi vao cong ');
    default:
      print('Ban phai mua ve truoc khi vao cong');
  }

  //cách 2: nâng cao
  // print(
  //     '${height < 130 ? "Ban duoc mien phi vao cong" : "Ban phai mua ve truoc khi vao cong"}');

  // bool isMale = false;

  // if (isMale) {
  //   print('Gioi tinh nam');
  // } else {
  //   print('Gioi tinh nu');
  // }

  // print('${isMale?'Gioi tinh nam': 'gioi tinh nu'}');
}
