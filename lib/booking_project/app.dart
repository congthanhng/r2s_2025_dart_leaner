import 'package:dart_learner/booking_project/core/route/route_named.dart';
import 'package:flutter/material.dart';

import 'core/route/route_management.dart';
import 'presentations/onboard/onboard_page.dart';

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteNamed.homePage,
      onGenerateRoute: RouteManagement.generateRoute,
    );
  }
}

//DRY (Don't Repeat Yourself), KISS (Keep It Simple Stupid)