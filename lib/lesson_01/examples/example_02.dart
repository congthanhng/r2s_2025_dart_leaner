///Constant vs Final
void main() {
  // const a = 3.5; //chạy đúng
  // print("Value of a is $a");
  //
  // const pi; // lỗi vì lúc xây dựng ứng dụng (build-time) const chưa được gắn giá trị ngay từ lúc khai báo.
  // pi = 4.23;
  // print("Value of PI is $pi");
  //
  //
  // final b;
  // b = 3.5;
  // print("Value of b is $b");
  // // chạy đúng
  //
  // final c;
  // c = 3.5;
  // c = 4.5;
  // print("Value of c is $c");
  // lỗi vì trong lúc ứng dụng đang chạy (run-time) final đã được gắn dữ liệu lần đầu là 3.5, sau lần gán
  // dữ liệu lần đầu này, biến final không thể thay đổi giá trị được nữa, nhưng chúng ta lại gắn tiếp cho
  // biến final với dữ liệu là 4.5, Sẽ xảy ra lỗi.

  ///Kết luận
  ///Constant check while in build-time
  ///Final check while in run-time
}
