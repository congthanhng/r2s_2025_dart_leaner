import 'dart:io';

void main() {
  print('Do dai danh sach course: ');
  final n = int.parse(stdin.readLineSync()!);

  final courses = List.generate(n, (index) =>  Course.input());

  // final courses2 = <Course>[];
  // for (int i = 0; i<n;i++){
  //   courses2.add(Course.input());
  // }

  findCourse(courses, 'Course A', 'Optional');

  optionalOutPut(courses);
}

class Course {
  final String code;
  final String name;
  final double duration;
  final String status;
  final String flag;

  Course({
    required this.code,
    required this.name,
    required this.duration,
    required this.status,
    required this.flag,
  });

  void output() {
    print('The info of course $name is:');
    print('     code: $code');
    print('     duration: $duration');
    print('     status: $status');
    print('     flag: $flag');
  }

  static Course input() {
    String code = '';
    do {
      print('nhap code:');
      code = stdin.readLineSync()!;
    } while (!RegExp(r'^FW\d{3}$').hasMatch(code));

    String name = '';
    do {
      print('nhap name:');
      name = stdin.readLineSync()!;
    } while (name.isEmpty);
    print('nhap duration:');
    final duration = double.parse(stdin.readLineSync()!);

    String status = '';
    do {
      print('nhap status:');
      status = stdin.readLineSync()!;
    } while (status != 'active' && status != 'in-active');

    String flag = '';
    do {
      print('nhap flag:');
      final flag = stdin.readLineSync()!;
    } while (flag != 'optional' && flag != 'mandatory' && flag != 'N/A');

    return Course(
        code: code, name: name, duration: duration, status: status, flag: flag);
  }
}

void optionalOutPut(List<Course> list) {
  for (var element in list) {
    if (element.flag == 'optional') {
      element.output();
    }
  }
}

void findCourse(List<Course> list, String type, dynamic data) {
  print('Courses with type $type are with $data: ');
  final names = list.where((element) => element.name == type).toList();
  if (data is String) {
    return names
        .where((element) =>
            element.flag == data ||
            element.code == data ||
            element.status == data)
        .toList()
        .forEach(
          (element) => element.output(),
        );
  }

  if (data is double) {
    return names.where((element) => element.duration == data).toList().forEach(
          (element) => element.output(),
        );
  }
}
