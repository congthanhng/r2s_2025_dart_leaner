///Arithmetic operator
void main() {
  print('cong: ${1 + 2}'); //3
  print('tru: ${2 - 1}'); //1
  print('nhan: ${1 * 2}'); //2
  print('chia: ${1 / 2}'); //0.5
  print('chia lay nguyen: ${1 ~/ 2}'); //0
  print('chia lay du: ${1 % 2}'); //1

  int a = 5;
  int b = 5;
  int c = 5;
  int d = 5;
  print('Gắn trước, tăng sau: ${a++}'); //6 Sai: 5
  print('Tăng trước, gắn sau: ${++b}'); //6

  print('Gắn trước, giảm sau: ${c--}'); //4 Sai: 5
  print('Giảm trước, gắn sau: ${--d}'); //4
}
