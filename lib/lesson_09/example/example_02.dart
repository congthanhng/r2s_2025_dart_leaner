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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController animateController;
  late final Animation<Offset> animation;

  @override
  void initState() {
    animateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    // animateController.repeat(reverse: true);

    animation = Tween<Offset>(begin: Offset(0, 1), end:  Offset(0, 0)).animate(animateController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:  SlideTransition(
        position: animation,
        child: Container(
          height: 150,
          width: 150,
          color: Colors.red,
        ),
      ),
    ));
  }
}
//scale, rotate, translate, sketch
//Rotate 1 tam hinh va thay doi kich thuoc khi nhan vo tam hinh va dung cursves.easeInOut
