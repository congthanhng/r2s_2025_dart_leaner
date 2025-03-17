import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:dart_learner/app_projects/booking_project/models/reservation_model.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/notification/notification_page.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/onboard/onboard_page.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/reservation/reservation_confirm_page.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/reservation/reservation_success_page.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/restaurant_list/restaurant_list_page.dart';
import 'package:dart_learner/app_projects/booking_project/presentations/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../presentations/home/home_page.dart';
import '../../presentations/product_list/product_list_page.dart';
import '../../presentations/reservation/reservation_page.dart';

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
      case RouteNamed.reservationPage:
        return MaterialPageRoute(
            builder: (context) => ReservationPage());
        case RouteNamed.reservationConfirmPage:
        return MaterialPageRoute(
            builder: (context) {
              final package = settings.arguments as Map<String, dynamic>;
              final data = package['data'] as Reservation;
              return ReservationConfirmPage(data: data,);
    } );
      case RouteNamed.reservationSuccessPage:
        return MaterialPageRoute(
            builder: (context) => ReservationSuccessPage());
      default:
        return MaterialPageRoute(builder: (context) => OnboardPage());
    }
  }
}
