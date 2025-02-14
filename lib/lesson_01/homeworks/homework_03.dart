/*
Viết 1 chương trình đánh giá xếp loại của học sinh theo cơ chê sau:
•If marks > 75 – grade A
•If 60 < marks < 75 – grade B
•If 45 < marks<60 – grade C
•If 35 < marks<45 - grade D
•If marks < 35 – grade E
*/

import 'dart:io';

void main() {
  double marks;
  do {
    stdout.write("Nhập vào một số từ 0 đến 100: ");
    marks = double.parse(stdin.readLineSync()!);
  } while (marks < 0 || marks > 100);

  if (marks > 75) {
    print('grade A');
  } else if (marks > 60 && marks <= 75) {
    print('grade B');
  } else if (marks > 45 && marks <= 60) {
    print('grade C');
  } else if (marks > 35 && marks <= 45) {
    print('grade D');
  } else {
    print('grade E');
  }
}
