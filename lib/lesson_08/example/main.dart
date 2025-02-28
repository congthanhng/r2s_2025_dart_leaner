import 'dart:developer';

import 'package:flutter/material.dart';

import 'route_named.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//O nam hinh Login co 1 textField nhap name.
//Nham quay ai thi hien thi welcom $name
// Sau khi mo man hinh Home thi hien thi text: Welcom $name to Flutter
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
      home: OnBoardPage(),
      // routes: {
      //   RouteNamed.onBoardPage: (context) => const OnBoardPage(),
      //   RouteNamed.homePage: (context)=> const HomePage(),
      //   RouteNamed.loginPage: (context)=> const LoginPage(),
      // },
      onGenerateRoute: (settings) {
        log('Setting');
        switch (settings.name) {
          case RouteNamed.onBoardPage:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OnBoardPage(),
              transitionDuration: Duration(seconds: 1),
              reverseTransitionDuration: Duration(seconds: 3),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(animation),
                  child: child,
                );
              },
            );

          case RouteNamed.homePage:
            final data = settings.arguments as Map<String, dynamic>;
            final name = data['nameKey'] as String;
            return PageTransitionManagement.slideTransition(HomePage(
              name: name,
            ));

          case RouteNamed.loginPage:
            return PageTransitionManagement.slideTransition(LoginPage());

          default:
            return MaterialPageRoute(
              builder: (context) => PageNotFound(),
            );
        }
      },
    );
  }
}

class PageTransitionManagement {
  static PageRouteBuilder<dynamic> slideTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(seconds: 1),
      reverseTransitionDuration: Duration(seconds: 3),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
              .animate(animation),
          child: child,
        );
      },
    );
  }
}


class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('404 Page noy FOund')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNamed.homePage);
                },
                child: Text('Home'))
          ],
        ),
      ),
    );
  }
}

//red
class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  String nameFromLogin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('Welcome $nameFromLogin')),
            ElevatedButton(
                onPressed: () async {
                  bool? result = true;
                  if (nameFromLogin.isEmpty) {
                    await showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (context) {
                        return Container(
                            // height: 400,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                  'Ban chua nhap ten, ban co muon tiep tuc'),
                            ));
                      },
                    );
                    // result = await showDialog<bool>(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) {
                    //     return SimpleDialog(
                    //       // initialTime: TimeOfDay(hour: 15, minute: 20),
                    //       // firstDate: DateTime.now(),
                    //       // lastDate: DateTime.now().add(Duration(days: 15)),
                    //
                    //       title: Text('Ban chua nhap ten'),
                    //       children: [
                    //         TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(context, false);
                    //             },
                    //             child: Text('Cancel')),
                    //         TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(context, true);
                    //             },
                    //             child: Text('OK')),
                    //       ],
                    //       // content:
                    //       //     Text('Ban chua nhap ten, ban co muon tiep tuc'),
                    //       // actions: [
                    //       //   TextButton(
                    //       //       onPressed: () {
                    //       //         Navigator.pop(context, false);
                    //       //       },
                    //       //       child: Text('Cancel')),
                    //       //   TextButton(
                    //       //       onPressed: () {
                    //       //         Navigator.pop(context, true);
                    //       //       },
                    //       //       child: Text('OK')),
                    //       // ],
                    //     );
                    //   },
                    // );
                  }

                  if (result ?? false) {
                    Navigator.pushNamed(context, RouteNamed.homePage,
                        arguments: <String, dynamic>{
                          'nameKey': nameFromLogin,
                        });
                  }
                },
                child: Text('Go Home')),
            ElevatedButton(
                onPressed: () async {
                  final result =
                      await Navigator.pushNamed(context, RouteNamed.loginPage);
                  if (result is String && result.isNotEmpty) {
                    nameFromLogin = result;
                    setState(() {});
                  }
                },
                child: Text('Go Login'))
          ],
        ),
      ),
    );
  }
}

//blue
class HomePage extends StatelessWidget {
  const HomePage({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('Welcom $name to Flutter')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNamed.loginPage);
                },
                child: Text('Go Login'))
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = '';
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('LoginPage')),
            TextFormField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Input your Name'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context, name);
                  }
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
