import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
      routes: {
        '/page1': (context)=> Page1(),
        '/page2': (context)=> Page2(),
      },
    );
  }
}

 String name = '';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              key: UniqueKey(),
              onFieldSubmitted: (newValue) {
                name = newValue??'';
                setState(() {

                });
              },
            ),
            Text('HELLO FROM Page 1: $name'),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/page2');
            }, child: Text('GO Page 2'))
          ],
        ),
      ),
    );
  }
}



class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              key: UniqueKey(),
              onFieldSubmitted: (newValue) {
                name = newValue??'';
                setState(() {
                });
              },
            ),
            Text('HELLO FROM Page 2: $name'),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Back to Page 1'))
          ],
        ),
      ),
    );
  }
}

