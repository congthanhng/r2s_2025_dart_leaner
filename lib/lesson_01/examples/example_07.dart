///Equality and relational operators
void main() {
  int userA = 123;
  int userB = 456;

  print((userA == 123) && (userB == 456)); //true vì true && true => true
  print((userA == 1213) && (userB == 456)); //false vì false && true => false
  print((userA == 123) || (userB == 456)); //true vì true || true => true
  print((userA == 1213) || (userB == 456)); //true vì false || true => true
  print((userA == 123) != (userB == 456)); //false vì true != true => false
  print((userA == 123) == (userB == 456)); //false vì true == true => true

  int a = 6;
  int b = 6;

  print("a co lon hon b khong?: ${a >= b ? true : false}");
}
