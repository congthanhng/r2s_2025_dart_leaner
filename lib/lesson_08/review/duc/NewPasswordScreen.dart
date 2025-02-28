import 'package:flutter/material.dart';
import 'package:bt_buoi8/SuccessScreen.dart';

class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Password")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SuccessScreen()),
            );
          },
          child: Text("Save"),
        ),
      ),
    );
  }
}
