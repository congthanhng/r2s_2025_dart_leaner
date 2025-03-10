import 'package:flutter/material.dart';
import '../route/route.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

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
            Center(child: Text('404 Page noy FOund')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNamed.homePage);
                },
                child: Text('Home'))
          ],
        ),
      ),
    );
  }
}