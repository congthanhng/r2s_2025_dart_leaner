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
