class User {
  User({this.name, this.age, this.gender = false});

  String? name;
  int? age;
  bool gender;

  static const _nameKey = 'name';
  static const _ageKey = 'age';
  static const _genderKey = 'gender';

  Map<String, dynamic> toJson() {
    return {"name": name, "age": age, "gender": gender};
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
        name: json[_nameKey] as String?,
        age: json[_ageKey] as int?,
        gender: json[_genderKey] as bool);
  }
}

final jsonExample = {"name": "Cong", "age": 18, "gender": true};
