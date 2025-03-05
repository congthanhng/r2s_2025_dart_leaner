// import 'package:flutter/material.dart';
// import 'package:bt_buoi8/HomeScreen.dart';
// import 'package:bt_buoi8/SignUpScreen.dart';
// import 'ForgotPasswordScreen.dart';
// import 'HomeScreen.dart';
// import '../cuong/homework.md';
// //relative import
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()),
//                 );
//               },
//               child: Text("Login"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignUpScreen()),
//                 );
//               },
//               child: Text("New here? Register"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
//                 );
//               },
//               child: Text("Forgot password?"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
