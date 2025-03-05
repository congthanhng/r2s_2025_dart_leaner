import 'package:dart_learner/booking_project/core/route/route_named.dart';
import 'package:dart_learner/booking_project/presentations/notification/notification_page.dart';
import 'package:dart_learner/booking_project/presentations/onboard/onboard_page.dart';
import 'package:dart_learner/booking_project/presentations/restaurant_list/restaurant_list_page.dart';
import 'package:dart_learner/booking_project/presentations/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../presentations/home/home_page.dart';
import '../../presentations/product_list/product_list_page.dart';

class RouteManagement {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamed.splashPage:
        return MaterialPageRoute(builder: (context) => SplashPage());
        case RouteNamed.onboardPage:
        return MaterialPageRoute(builder: (context) => OnboardPage());
      case RouteNamed.homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
        case RouteNamed.productListPage:
        return MaterialPageRoute(builder: (context) => ProductListPage());
        case RouteNamed.notificationPage:
        return MaterialPageRoute(builder: (context) => NotificationPage());
        case RouteNamed.restaurantListPage:
        return MaterialPageRoute(builder: (context) => RestaurantListPage());
      default:
        return MaterialPageRoute(builder: (context) => OnboardPage());
    }
  }
}
