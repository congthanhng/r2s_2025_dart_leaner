///Type test operators
void main() {
  String a = 'Hello';
  var b = 12;
  const c = false;
  double d = 0.5;
  //num: int || double
  print(a is String); //true
  print(b is num); // false => true
  print(c is bool); //true
  print(d is! int); //true
}
