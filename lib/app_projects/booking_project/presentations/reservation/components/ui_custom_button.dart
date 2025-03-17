import 'package:flutter/material.dart';

class UICustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const UICustomButton({super.key, required this.text, this.onPressed});

  @override
  _UICustomButtonState createState() => _UICustomButtonState();
}

class _UICustomButtonState extends State<UICustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 327,
        height: 44,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAD3F32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}