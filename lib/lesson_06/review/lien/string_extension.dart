// class StringExtension {
//   static bool checkNumber(String value) {
//     value.split('').forEach((ch) {
//       if (RegExp(r'^[0-9]+$').hasMatch(ch)) {
//         return true;
//       }
//     });
//     return false;
//   }
//
//   static bool checkUpperCase(String value) {
//     value.split('').forEach((ch) {
//       if (RegExp(r'^[A-Z]+$').hasMatch(ch)) {
//         return true;
//       }
//     });
//     return false;
//   }
//
//   static bool checkLowerCase(String value) {
//     if (RegExp(r'^[a-z]+$').hasMatch(value)) {
//       return true;
//     }
//     return false;
//   }
//
//   static bool checkSpecialCase(value) {
//     value.split('').forEach((ch) {
//       if (!RegExp(r'^[a-zA-Z]+$').hasMatch(ch)) {
//         return true;
//       }
//     });
//     return false;
//   }
// }
//
// extension StringExtension2 on String {
//   bool checkNumber() {
//     if (RegExp(r'^[0-9]+$').hasMatch(this)) {
//       return true;
//     }
//     return false;
//   }
//
//   bool checkUpperCase() {
//     if (RegExp(r'^[A-Z]+$').hasMatch(this)) {
//       return true;
//     }
//     return false;
//   }
// }
//
// //int abc = 15;
// // abc.printSomething();
//
// extension IntExtension on int?{
//   void printSomething(){
//     print('Current value: $this');
//   }
// }
