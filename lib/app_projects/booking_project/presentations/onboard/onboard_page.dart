import 'package:dart_learner/app_projects/booking_project/services/onboard_services.dart';
import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/onboard/widgets/slide_01.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/slide_02.dart';
import 'widgets/slide_03.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late final PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //logo
          Image.asset(
            'assets/images/logo.png',
            width: 211,
            height: 102,
          ),
          //content
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                currentPage = value;
              },
              children: [
                Slide01(),
                Slide02(),
                Slide03(),
              ],
            ),
          ),

          //indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  OnboardService.saveOnboardToLocal();
                  Navigator.pushReplacementNamed(context, RouteNamed.homePage);
                },
                child: Text('Skip'),
              ),
              SmoothPageIndicator(
                  controller: controller,
                  // PageController
                  count: 3,
                  effect: WormEffect(activeDotColor: Color(0xffAD3F32)),
                  // your preferred effect
                  onDotClicked: (index) {}),
              IconButton(
                  onPressed: () {
                    if (currentPage == 2) {
                      OnboardService.saveOnboardToLocal();
                      Navigator.pushReplacementNamed(
                          context, RouteNamed.homePage);
                    } else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded))
            ],
          ),
        ],
      )),
    );
  }
}
