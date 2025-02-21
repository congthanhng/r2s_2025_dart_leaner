// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Hello world',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
      body: Container(
        color: Colors.lightGreen,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Toi muon text mau do, size 20, do day bold
                Icon(Ionicons.home),
                Icon(Icons.home),
                const Text(
                  'Text 1 kasldfj klasjf klasjf klasjdf klasjdfk jasklf jasklf jaksldj lkasjdf klajsdf kljadsf lkf ',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    // decoration: TextDecoration.overline,
                  ),
                ),

                //Buttons
                OutlinedButton(
                    onPressed: () {
                      print('Bna da click vao button');
                    },
                    child: Text('Click me')),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                    ),
                    onPressed: () {},
                    child: Text('Click me 2')),

                TextButton(onPressed: () {}, child: Text('Click me 2')),

                //icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.access_alarm_rounded,
                      color: Colors.cyan,
                      size: 42,
                    ),
                    Icon(
                      Icons.access_alarm_rounded,
                      color: Colors.cyan,
                      size: 42,),
                    IconButton(
                        onPressed: () {
                          print('Bna da click vao icon button home');
                        },
                        icon: Icon(Icons.home,))
                  ],
                ),

                //images
                // Container(
                //   color: Colors.red,
                //   child: Image.asset(
                //     'assets/images/image_test.jpg',
                //     width: 500,
                //     height: 200,
                //     scale: 0.5,
                //     fit: BoxFit.none,
                //   ),
                // ),
                // Image.asset('assets/images/image_real.jpg'),
                Image.network('https://picsum.photos/200/300')

                ///Tao cho toi mot text "Hello world" voi cac thong so sau:
                // - Mau Xanh la cay: green
                // - Size 30
                // - Do day medium
                // - co Gach duoi

                ///Tao cho toi mot text so 2:
                // "Xin chao toi co the giup gi cho ban, toi la mo hinh ngon ngu cua openAI"
                // voi cac thong so sau:
                // - Mau Xanh la cay: DO
                // - Size 50
                // - Toi da 2 dong
                // - Cos textOverFlow.ellipsis
                // - Do day semiBold

                // Text(
                //   'Text 2',
                //   style: Theme.of(context).textTheme.headlineMedium,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
