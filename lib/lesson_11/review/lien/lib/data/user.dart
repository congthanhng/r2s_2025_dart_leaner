class User {
  User({this.name, this.phone, this.email, this.pass, this.confirm });

  String? name;
  int? phone;
  String? email;
  String? pass;
  String? confirm;

  static const _nameKey = 'name'; static const _phoneKey = 'phone'; static const _emailKey = 'gender'; static const _passKey = 'pass'; static const _confirmKey = 'confirm';

  Map<String, dynamic> toJson() {
    return {"name": name, "phone": phone, "email": email, "pass": pass, "confirm": confirm};
  }

  static User fromJsonToMap(Map<String, dynamic> json) {
    return User(
      name: json[_nameKey] as String?,
      phone: json[_phoneKey] as int?,
      email: json[_emailKey] as String?,
      pass: json[_passKey] as String?,
      confirm: json[_confirmKey] as String?
    );
  }
}

final jsonExample = {"name": "Cong", "age": 18, "gender": true};
