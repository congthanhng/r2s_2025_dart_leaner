
import 'package:flutter/material.dart';

class UICount extends StatefulWidget {
  const UICount({super.key, required this.title, this.onCountChanged});
  final String title;
  final ValueChanged<int>? onCountChanged;

  @override
  State<UICount> createState() => _UICountState();
}

class _UICountState extends State<UICount> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(widget.title),
      Row(children: [
        IconButton(onPressed: (){
          if(count == 0) return;
          count--;
          widget.onCountChanged?.call(count);
          setState(() {});
        }, icon: Icon(Icons.remove)),
        Text(count.toString()),
        IconButton(onPressed: (){
          count++;
          widget.onCountChanged?.call(count);
          setState(() {});
        }, icon: Icon(Icons.add)),
      ],),
    ],);
  }
}
