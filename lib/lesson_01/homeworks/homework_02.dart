/*
Requirement:
Nhập vào mức lương cơ bản của nhân viên và xếp loại của nhân viên.
Tiền hoa hồng được tính dựa theo xếp loại của nhân viên:
Loại A: $300
Loại B: $250
Loại Khác: $100

Output: tính lương của nhân viên nhận được trong tháng đó, biết rằng:

Lương nhân viên = lương cơ bản + hoa hồng
*/

// void main(){
//   //Lưu ý:
//   //Để nhập dữ liệu từ bàn phìm trước tiên phải gọi: import 'dart:io';
//   //Sau đó gọi dòng này để người dùng nhập dữ liệu từ bàn phím:
//   //stdin.readLineSync()
//   //Hàm trên sẽ trả về kiểu String, nên muốn nhập kiểu num thì thực hiện bước sau:
//   //int.parse(stdin.readLineSync())
//
//   //Hãy code bên dưới
//
//
// }
import 'dart:io';

void main(List<String> args) {
  print("\nNhập lương cơ bản:");

  int salary = int.parse(stdin.readLineSync() ?? '');

  print("\n Nhập xếp loại:");

  String grade = stdin.readLineSync() ?? '';

  // if (grade == "A" || grade == "a") {
  //
  //   print("\n:Lương: ${salary + 300}");
  //
  // } else if (grade == "B" || grade == "b") {
  //
  //   print("\n:Lương: ${salary + 250}");
  //
  // } else {
  //
  //   print("\n:Lương: ${salary + 100}");
  //
  // }

  // switch(grade){
  //   case 'a': print('\n:Lương: ${salary + 300}'); break;
  //   case 'b': print('\n:Lương: ${salary + 250}'); break;
  //   default: print('\n:Lương: ${salary + 100}'); break;
  // }
  /// switch - case chi su dụng cho so sánh bằng

  var mark = 5;

  if (mark > 5 && mark <= 6.5) {
    print('\n:Lương: ${salary + 300}');
  } else {
    print('\n:Lương: ${salary + 100}');
  }

  //test git
}
