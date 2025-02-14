

int tinhTong(
    {int a = 1, int? b, required int c, required int d, required int e}) {
  //body

  if (b != null) {
    final sum = a + b + c + d + e;
    return sum;
  } else {
    final sum = a + (b ?? 11) + c + d + e;
    return sum;
  }
}

void main() {
  //type + name + tham so truyen vao (optional) + body
  //named
  // tinhTong(c: 15, d: 20, e: 25);

  // int? m;

  // String? name;
  //
  // String pharse = 'xin chao ${name ?? 'Giau ten'}';
  //
  // print(pharse);
  // print('phrase 2: Xin chao ${name ?? 'thay te'}');

  // print('adfjhg: $m');

  print('Dien Tich Tam Giac vs Scale: ${dienTichVoiScale(a: 1, b: 2, c: 3)}');
}
// Bai tap: viết function tinh chu vi của một tam giác A, B, C. Với A, B, C là số nhập vào

// function tinh dien tinh của một tam giác A, B, C và diện tích đó nhân cho một hệ số scale (nếu có)
// A = 1, B =2, C=3 => S = 1 * 2 * 3 = 6
// hệ số scale 1.5 (nếu truyền vào) (default = 1) => kết quả = S * 1.5
double dienTichVoiScale({
  required int a,
  required int b,
  required int c,
  double? scale,
}) =>
    a * b * c * (scale ?? 1);

// double dienTichVoiScale({
//   required int a,
//   required int b,
//   required int c,
//   double? scale,
// }){
//   //do nothing
//   return  a * b * c * (scale ?? 1);
// }
