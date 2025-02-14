///Variables in Dart
void main() {
  // //Declaring Variables
  // String name = "John";
  // bool isMarried = false;
  // //num include int or double
  // int age = 20;
  // double height = 5.9;
  //
  // //printing variables value
  // //String interpolation: To put the value of an expression inside a string, use ${expression}. If the expression is an identifier, you can omit the {}.
  // print("Name is $name");
  // print("Age is $age");
  // print("Height is $height");
  // print("Married Status is $isMarried");
  //
  // String doanVan = 'Hello ban $name';

  //Map: Key - value
  // Map<String, dynamic> personalInfo = {
  //   'name': 'Cong',
  //   'age': 18,
  //   'isMale': true,
  //   'height': 1.98
  // };

  List<String> favoriteColors = ['do', 'xanh', 'tim', 'do'];

  favoriteColors.removeWhere(
    (element) => element == 'do',
  );
  // favoriteColors.remove('do');
  print('${favoriteColors}');

  // print('Cac mau ua thich 1: $favoriteColors');
  // favoriteColors.add('vang');
  // print('Cac mau ua thich 2: $favoriteColors');
  // favoriteColors.remove('do');
  // print('Cac mau ua thich 3: $favoriteColors');

  // print('Mau dau tien cua toi: ${favoriteColors[0]}');
  // print('Mau index 2 cua toi: ${favoriteColors[2]}');
  //
  // print("\nThe information with Map: $personalInfo");
  // print("The name from personalInfo: ${personalInfo['name']}");
  // print("The age from personalInfo: ${personalInfo['age']}");
  // print("The gender from personalInfo: ${personalInfo['isMale']}");
}

// viet chuong trinh su dung Map de luu thong tin ca nha va in ra:
// Ho ten - nam sinh - gioi tinh - diem trung binh tu Map do
