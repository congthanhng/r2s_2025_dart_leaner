import 'package:flutter/material.dart';

class Slide02 extends StatelessWidget {
  const Slide02({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [

                SizedBox(height: 20),
                Image.asset(
                  'assets/images/img_convenient.png',
                  height: 250,
                ),
                SizedBox(height: 20),
                Text(
                  'Convenient',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Online dish reservation',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

