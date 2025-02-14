//Mỗi LỚP HỌC sẽ gồm 1 GIÁO VIÊN và các HỌC SINH

//Mỗi HỌC SINH sẽ có các thông tin sau:
// - Tên
// - Giới tính
// - Điểm trung bình (số thập phân gồm 2 chữ số thập phân)
// - Điểm cộng (Nếu học sinh là NỮ thì điểm cộng sẽ luôn là 2 và NAM sẽ luôn là 1.)

//Mỗi GIÁO VIÊN sẽ có các thông tin sau:
// - Tên
// - Giới tính

//Cuối học kì, GIÁO VIÊN sẽ phải xếp loại cho từng bạn học sinh dựa trên điểm tổng
//Điểm tổng sẽ được tính bằng công thức sau: điểm tổng = điểm trung bình + điểm cộng
//Dựa và điểm tổng mà xếp loại của học sinh như sau:
//Loại yếu: điểm tổng < 5
//Loại trung bình: 5 <= điểm tổng < 6.5
//Loại Khá: 6.5 <= điểm tổng < 8
//Loại giỏi: 8 <= Điểm tổng < 9
//Loại xuất sắc: 9 <= điểm tổng

//Output: In ra xếp loại học sinh theo cú pháp sau:
// "Học sinh <Tên học sinh> đạt loại: <Xếp loại của học sinh>"

void main() {
  Teacher teacherA = Teacher(isMale: true, name: 'T.Cong', tuoi: 50);
  Teacher teacherB = Teacher(isMale: true, name: 'T.CONGGGGGGGGG', tuoi: 49);

  teacherB.setHairLength = 20;

  print('TUOI CUa B: ${teacherB.hairLength}');

  List<Student> students = [
    Student(name: 'X.Duc', isMale: true, average: 7.5, tuoi: 22),
    Student(name: 'D.Anh', isMale: true, average: 1.4, tuoi: 22),
    Student(name: 'M.Cuong', isMale: true, average: 6.5, tuoi: 22),
    Student(name: 'K.Hung', isMale: true, average: 9, tuoi: 22),
  ];
  LopHoc classA = LopHoc(teacher: teacherA, students: students);
  classA.output();
}

class Human {
  Human({
    required this.name,
    required this.isMale,
    required int tuoi,
  }) : _age = tuoi;

  //Properties
  //Include GETTER
  final String name;

  //INclude GETTER And SETTER
  bool isMale;

  final int _age;

  int? _hairLength;

  //methods SETTER
  set setHairLength(int length) => _hairLength = length;

  //GETTER
  int get hairLength => _hairLength ?? 0;

  //methods GETTER
  int get age => _age;

  //methods
  void walk() {
    print('Đang chạy');
  }
}

class Teacher extends Human {
  Teacher({required super.isMale, required super.name, required super.tuoi});

  //methods
  String xepLoai({required Student student}) {
    //Cach 1
    switch (student.sum()) {
      case < 5:
        return 'yeu';
      case <= 5 && < 6.5:
        return 'Trung binh';
      case <= 6.5 && < 8:
        return 'Kha';
      case <= 8 && < 9:
        return 'Gioi';
      default:
        return 'Xuat sac';
    }

    //Cach 2
    // return switch (student.sum()) {
    //   < 5 => 'yeu',
    //   <= 5 && < 6.5 => 'Trung binh',
    //   <= 6.5 && < 8 => 'Kha',
    //   <= 8 && < 9 => 'Gioi',
    //   _ => 'Xuat sac'
    // };
  }
}

class Student extends Human {
  Student(
      {required super.name,
      required super.isMale,
      required this.average,
      required super.tuoi})
      : additionalPoint = isMale ? 1 : 2;

  //Properties
  double average;
  int additionalPoint;

  double sum() => average + additionalPoint;
}

class LopHoc {
  LopHoc({required this.teacher, required this.students});

  //Properties
  final Teacher teacher;
  final List<Student> students;

  void output() {
    for (final student in students) {
      print(
          'Học sinh ${student.name} đạt loại: ${teacher.xepLoai(student: student)}');
    }
  }
}
