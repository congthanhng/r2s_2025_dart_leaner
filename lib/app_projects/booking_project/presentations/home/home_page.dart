
import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:flutter/material.dart';

import '../drawer/menu_drawer_page.dart';
import 'widgets/restaurant_section.dart';
import 'widgets/section_discount.dart';
import '../widgets/ui_text_input.dart';
import 'widgets/best_seller_section.dart';
import 'widgets/slide_show.dart';

class HomePage extends StatefulWidget {
  final String? name;
  final String? email;
  const HomePage({super.key, this.name, this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6EFE8),
      drawer: DrawerMenu(
        userName: widget.name,
      ),
      appBar: AppBar(

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNamed.notificationPage);
            },
            icon: Icon(Icons.notifications_active),
          )
        ],
        title: Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.place,
                  color: Colors.deepOrangeAccent,
                ),
                Text("Dong Khoi st, District 1"),
              ],
            ),

          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextInput(
                hintText: "Search",
                type: "text",
                controller: textController,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SlideShow(),
                      SizedBox(
                        height: 24,
                      ),
                      BestSellerSection(),
                      SizedBox(
                        height: 12,
                      ),
                      SectionRestaurant(title: "OUR RESTAURANT"),
                      SectionDiscount(title: "HAPPY DEALS")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}