import 'package:flutter/material.dart';

class Slide01 extends StatelessWidget {
  const Slide01({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/img_nearby.png',
            width: 250,
            height: 250,
          ),
          SizedBox(height: 20),
          Text(
            'Delicious',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Enjoy great food with your family',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
