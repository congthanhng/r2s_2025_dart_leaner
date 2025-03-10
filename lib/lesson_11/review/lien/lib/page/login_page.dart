import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = '';
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('LoginPage')),
            TextFormField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Input your Name'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context, name);
                  }
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}