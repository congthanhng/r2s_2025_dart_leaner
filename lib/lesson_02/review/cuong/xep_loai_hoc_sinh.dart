import 'student.dart';

void main() {
  Student student1 = Student(name: 'Cuong', isMale: true, average: 5.34523);
  student1.output();
  print(student1.diemTong());
}
