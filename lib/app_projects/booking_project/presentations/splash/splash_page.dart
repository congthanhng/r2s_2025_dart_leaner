import 'dart:async';

import 'package:dart_learner/app_projects/booking_project/services/onboard_services.dart';
import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        final isFirstOpen = OnboardService.isFirstOpen();
        if (isFirstOpen) {
          Navigator.pushReplacementNamed(context, RouteNamed.onboardPage);
        } else {
          Navigator.pushReplacementNamed(context, RouteNamed.homePage);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 211,
          height: 102,
        ),
      ),
    );
  }
}
