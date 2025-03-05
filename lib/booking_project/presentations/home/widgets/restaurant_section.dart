import 'package:dart_learner/booking_project/core/route/route_named.dart';
import 'package:dart_learner/booking_project/presentations/home/widgets/restaurant_card.dart';
import 'package:dart_learner/booking_project/presentations/widgets/ui_section.dart';
import 'package:flutter/material.dart';

import '../home_data.dart';

class SectionRestaurant extends StatelessWidget {
  final String title;

  const SectionRestaurant({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return UISection(
      title: 'Our restaurant',
      onPress: () {
        Navigator.pushNamed(context, RouteNamed.restaurantListPage);
      },
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) => ListView.builder(
    itemCount: 3,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder:(context, index) =>  RestaurantCard(
      address: HomePageData.restaurant[index].address ?? "",
      nameRestaurant: HomePageData.restaurant[index].nameRestaurant ?? "",
      image: HomePageData.restaurant[index].image,
    ),
  );
}
