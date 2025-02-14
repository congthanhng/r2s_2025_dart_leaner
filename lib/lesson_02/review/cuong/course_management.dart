import 'course.dart';

void main() {
  // Course course1 = Course.input();
  // course1.output();
  List<Course> courses = [
    Course(
      name: "Flutter Basics",
      code: "FW102",
      duration: 30,
      status: "active",
      flag: "optional",
    ),
    Course(
      name: "Advanced Flutter",
      code: "FW201",
      duration: 45,
      status: "in-active",
      flag: "optional",
    ),
    Course(
      name: "Dart Programming",
      code: "FW302",
      duration: 25,
      status: "active",
      flag: "optional",
    ),
    Course(
      name: "State Management",
      code: "FW403",
      duration: 35,
      status: "in-active",
      flag: "optional",
    ),
    Course(
      name: "Flutter Animations",
      code: "FW504",
      duration: 40,
      status: "active",
      flag: "optional",
    ),
    Course(
      name: "Flutter Animations",
      code: "FW605",
      duration: 50,
      status: "active",
      flag: "optional",
    ),
    Course(
      name: "Flutter UI Design",
      code: "FW706",
      duration: 30,
      status: "in-active",
      flag: "optional",
    ),
    Course(
      name: "Testing in Flutter",
      code: "FW807",
      duration: 20,
      status: "active",
      flag: "optional",
    ),
    Course(
      name: "Flutter for Web",
      code: "FW908",
      duration: 35,
      status: "in-active",
      flag: "optional",
    ),
  ];

  findCourse(courses, "Flutter Animations")
      ?.forEach((course) => course.output());

  Course a = input();
}
