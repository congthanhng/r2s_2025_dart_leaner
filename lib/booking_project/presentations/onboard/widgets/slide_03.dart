import 'package:flutter/material.dart';

class Slide03 extends StatelessWidget {
  const Slide03({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [

            const SizedBox(height: 100),
            Image.asset('assets/images/img_delicious.png'),
            const SizedBox(
              height: 36,
            ),
            const Text('Nearby restaurants'),
            const Text('Don\'t have to go far to find a good restaurant'),
            const SizedBox(
              height: 36,
            ),

          ],
        ),
      ),
    );
  }
}
