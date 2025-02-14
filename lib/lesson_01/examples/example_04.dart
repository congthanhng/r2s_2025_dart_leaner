import 'dart:io';

///input from terminal
void main() {
  //Notice:
  //Firstly, you must import the IO package: import 'dart:io';
  //Secondly, to input data in CLI (command line interface) you must call this:
  //stdin.readLineSync()

  //your code here
  print('input your name: ');
  var name = stdin.readLineSync();

  print('input your age:');
  var age = int.parse(stdin.readLineSync() ?? '');

  print('Welcome to Flutter! $name - $age');
}
