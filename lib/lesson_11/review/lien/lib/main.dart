import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page/signup_page.dart';
import 'page/login_page.dart';
import 'page/notfound_page.dart';
import 'page/onboard_page.dart';
import 'page/home_page.dart';
import '../route/route.dart';
import 'page/bestseller_page.dart';


//import 'package:flutter_application_4/user.dart';
// #docregion migrate




class AppPreference {
  static SharedPreferences? prefsLocal;
}

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  AppPreference.prefsLocal = await SharedPreferences.getInstance() ;
  runApp(MyApp());
}  


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffF6efe8), // Set the app's primary theme color
      ),
      title: 'Flutter Form Example',
      home: BestsellerPage(),
    );
  }
}



//-----------------------------------------------
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: OnBoardPage(),
//       // routes: {
//       //   RouteNamed.onBoardPage: (context) => const OnBoardPage(),
//       //   RouteNamed.homePage: (context)=> const HomePage(),
//       //   RouteNamed.loginPage: (context)=> const LoginPage(),
//       // },
//       onGenerateRoute: (settings) {
//         // log('Setting');
//         switch (settings.name) {
//           case RouteNamed.onBoardPage:
//             return PageRouteBuilder(
//               pageBuilder: (context, animation, secondaryAnimation) =>
//                   OnBoardPage(),
//               transitionDuration: Duration(seconds: 1),
//               reverseTransitionDuration: Duration(seconds: 3),
//               transitionsBuilder:
//                   (context, animation, secondaryAnimation, child) {
//                 return SlideTransition(
//                   position:
//                       Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
//                           .animate(animation),
//                   child: child,
//                 );
//               },
//             );

//           case RouteNamed.homePage:
//             final data = settings.arguments as Map<String, dynamic>;
//             final name = data['nameKey'] as String;
//             return PageTransitionManagement.slideTransition(HomePage(
//               name: name,
//             ));

//           case RouteNamed.loginPage:
//             return PageTransitionManagement.slideTransition(LoginPage());

//           default:
//             return MaterialPageRoute(
//               builder: (context) => PageNotFound(),
//             );
//         }
//       },
//     );
//   }
// }

// class PageTransitionManagement {
//   static PageRouteBuilder<dynamic> slideTransition(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionDuration: Duration(seconds: 1),
//       reverseTransitionDuration: Duration(seconds: 3),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return SlideTransition(
//           position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
//               .animate(animation),
//           child: child,
//         );
//       },
//     );
//   }
// }