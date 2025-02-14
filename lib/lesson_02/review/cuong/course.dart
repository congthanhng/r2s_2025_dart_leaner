import 'dart:io';

///INPUT
Course input() {
  String name = inputName();
  String code = inputCode();
  double duration = inputDuration();
  String status = inputStatus();
  String flag = inputFlag();
  return Course(
    name: name,
    code: code,
    duration: duration,
    status: status,
    flag: flag,
  );
}

///name input
String inputName() {
  print("Nhập tên khóa học: ");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input.trim().isEmpty) {
      print("Tên không được để trống. Vui lòng nhập lại.");
      continue;
    }
    return input;
  }
}

///Code input
String inputCode() {
  final RegExp regex = RegExp(r'^FW(?:(\d)(?!\1)(\d)(?!\1|\2)(\d))$');
  while (true) {
    print(
        "Nhập id khoa hoc (định dạng: FWxxx, với xxx là 3 chữ số khong trung lap): ");
    String input = stdin.readLineSync()!;
    if (!regex.hasMatch(input)) {
      print("Code không hợp lệ. Vui lòng nhập lại theo định dạng FWxxx.");
      continue;
    }
    return input;
  }
}

/// Duration input
double inputDuration() {
  while (true) {
    print("Nhập thời gian: ");
    double input = double.parse(stdin.readLineSync()!);
    if (input <= 0) {
      print("Thời gian không hợp lệ. Vui lòng nhập lại.");
      continue;
    }
    return input;
  }
}

/// Status input
String inputStatus() {
  print("Nhập trạng thái: ");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input != 'active' && input != 'in-active') {
      print(
          "Trạng thái chỉ chấp nhận giá trị 'active' hoặc 'in-active'. Vui lòng nhập lại.");
      continue;
    }
    return input;
  }
}

/// Flag input
String inputFlag() {
  print("Nhập flag: ");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input.trim().isEmpty) {
      input = 'optional';
      return input;
    }
    if (input != 'optional' && input != 'mandatory' && input != 'N/A') {
      print(
          "Flag chỉ chấp nhận giá trị 'optional', 'mandatory' hoặc 'N/A'. Vui lòng nhập lại.");
      continue;
    }
    return input;
  }
}

class Course {
  String name;
  String code;
  double duration;
  String status;
  String flag;

  /// CONTRUCTOR
  Course({
    required this.name,
    required this.code,
    required this.duration,
    required this.status,
    required this.flag,
  });

  ///OUTPUT
  void output() {
    print('name: $name');
    print('code: $code');
    print('duration: $duration');
    print('status: $status');
    print('flag: $flag');
  }
}

List<Course>? findCourse(List<Course> courses, String name) {
  List<Course> result = [];
  for (Course course in courses) {
    if (course.name == name) {
      result.add(course);
    }
  }
  return result.isEmpty ? null : result;
}
