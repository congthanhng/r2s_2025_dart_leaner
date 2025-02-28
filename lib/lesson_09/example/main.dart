import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTransformColor = false;
  double size = 150;
  double borderRadius = 2;
  double opacity = 0.2;

  double scale = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedScale(
            duration: Duration(seconds: 1),
            scale: scale,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              onEnd: () {
                setState(() {
                  isTransformColor = !isTransformColor;
                });
              },
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OKOKO')));
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color:  Colors.red,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color:  isTransformColor?Colors.blue:Colors.yellow,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                scale +=0.5;
                borderRadius+=2;
                opacity +=0.2;
                size += 50;
                // isTransformColor = !isTransformColor;
              });
            },
            child: Text('Do animation'),
          ),
        ],
      ),
    ));
  }
}
//scale, rotate, translate, sketch
//Rotate 1 tam hinh va thay doi kich thuoc khi nhan vo tam hinh va dung cursves.easeInOut