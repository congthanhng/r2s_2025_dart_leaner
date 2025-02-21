// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          textTheme: TextTheme(bodyMedium: TextStyle())
          // buttonTheme: ButtonThemeData(
          //   buttonColor: Colors.black,
          //   focusColor: Colors.red,
          //   hoverColor: Colors.orange,
          // ),
          ),
      home: MyHomeHome3(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.pregnant_woman_sharp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.camera),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.video_call),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(Icons.headphones),
                    Icon(Icons.settings),
                    Text('HELLOW WORK'),
                    Container(
                      height: 50,
                      width: 10,
                      color: Colors.blue,
                    )
                  ],
                ),
              ],
            ),

            //Box 1
            Container(
              height: 300,
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ],
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.blue, Colors.yellow],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    // margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    padding: EdgeInsets.all(5),
                    // margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text('Box 1')),
                  ),

                  Container(
                    height: 150,
                    width: 100,
                    color: Colors.red,
                    child: Center(child: Text('box 2')),
                  )

                  ///Tao cho a 1 container chua 1 hinh anh(w:150xh:75) vaf 1 button to chuc theo chieu doc
                  ///Container co mau xanh, kich thuoc 200x300. bo goc 10. Border mau do
                  ///Cac con se nam giua container

                  // Container(
                  //   width: 150,
                  //   height: 150,
                  //   color: Colors.green,
                  //   child: Text('Box 2'),
                  // ),
                ],
              ),
            ),

            Container(
              height: 150,
              width: 100,
              color: Colors.blue,
              child: Center(child: Text('box 3')),
            )
            // Text('Box 3'),
          ],
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                width: 500,
                height: 500,
                color: Colors.red,
                child: Center(child: Text('Box 1')),
              ),
            ),
            Positioned(
              top: 50,
              left: 60,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                child: Center(child: Text('Box 2')),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 50,
                height: 60,
                color: Colors.yellow,
                child: Center(child: Text('Box 3')),
              ),
            ),
            Text('Box 4')
          ],
        ),
      ),
    );
  }
}

class MyHomeHome3 extends StatelessWidget {
  MyHomeHome3({super.key});

  final List<String> names = [
    'milk',
    'water',
    'food',
    'milk',
    'water',
    'food',
    'milk',
    'water',
    'food',
    'milk',
    'water',
    'food',
    'milk',
    'water',
    'food',
    'milk',
    'water',
    'food',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: names.length,
        itemBuilder: (context, index) {
          return _buildToDoItem(context, names[index]);
        },
      )),
    );
  }

  Widget _buildToDoItem(BuildContext context, String name) {
    return Container(
      // color: Colors.red,
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Text(name)
        ],
      ),
    );
  }
}
