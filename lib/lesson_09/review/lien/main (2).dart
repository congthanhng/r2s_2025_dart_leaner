import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin{
    double turn = 0;
    double scale = 1;
    double turn_1 = -15/360;

    late final AnimationController animateController_1;
    late final Animation<double> animation_1;
    late final AnimationController animateController_2;
    late final Animation<double> animation_2;
    late final AnimationController animateController_3;
    late final Animation<Offset> animation_3;
    late final AnimationController animateController_4;
    late final Animation<Offset> animation_4;
    late final Animation<double> animation_5;
    late final AnimationController animateController_5;


    @override
    void initState() {
      animateController_1 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..repeat(reverse: true);
      // animateController.repeat(reverse: true);
      animation_1 = Tween(begin: -15/360, end:  15/360).animate(animateController_1);
      super.initState();

      //scale 0.2->1
      animateController_2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      )..forward();
      animation_2 = Tween(begin: 0.2, end:  1.0).animate(animateController_2);
      super.initState();

      animateController_3 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..forward();
      // animateController.repeat(reverse: true);
      animation_3 = Tween<Offset>(begin: Offset(-1,0), end:  Offset(0,0)).animate(animateController_3);
      super.initState();

      animateController_4 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..forward();
      // animateController.repeat(reverse: true);
      animation_4 = Tween<Offset>(begin: Offset(1,0), end:  Offset(0,0)).animate(animateController_4);
      super.initState();

      animateController_5 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      )..forward();
      animation_5 = Tween(begin: 0.2, end:  1.0).animate(animateController_5);
      super.initState();
    }

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
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // AnimatedRotation(
            //   turns: turn, duration: Duration(milliseconds: 300),
            //   child: AnimatedScale(
            //     scale: scale, duration: Duration(milliseconds: 300),
            //     child: GestureDetector(
            //       behavior: HitTestBehavior.translucent,
            //       child: Image.asset('image/1.jpg', width: 300, fit: BoxFit.cover,),
            //       onTap: () {
            //         setState(() {
            //           scale += 1;
            //         });
            //       },                
            //     )                
            //   )
            // ),
            RotationTransition(
              turns: animation_1, 
              child: Image.asset('image/1.jpg', width: 200, fit: BoxFit.cover,),  
            ),
            ScaleTransition(
              scale: animation_2,
              child: Image.asset('image/1.jpg', width: 200, fit: BoxFit.cover,),
            ),
            SlideTransition(
              position: animation_3,
              child: Image.asset('image/1.jpg', width: 200, fit: BoxFit.cover,),
            ),
            SlideTransition(
              position: animation_4,
              child: Image.asset('image/1.jpg', width: 200, fit: BoxFit.cover,),
            )
              
          ],
            
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            turn += 1;
            
          });
        },
        child: Text('Do animation'),
        // child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
