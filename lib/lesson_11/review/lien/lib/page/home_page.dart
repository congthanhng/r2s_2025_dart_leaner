import 'package:flutter/material.dart';
import '../route/route.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('Welcom $name to Flutter')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNamed.loginPage);
                },
                child: Text('Go Login'))
          ],
        ),
      ),
    );
  }
}