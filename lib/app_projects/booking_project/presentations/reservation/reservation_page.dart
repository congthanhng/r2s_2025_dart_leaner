import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:dart_learner/app_projects/booking_project/models/restaurant_model.dart';
import 'package:dart_learner/app_projects/booking_project/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/reservation_model.dart';
import 'bloc/reservation_bloc.dart';
import 'components/ui_count.dart';
import 'components/ui_custom_button.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPage();
}

class _ReservationPage extends State<ReservationPage>
    with TickerProviderStateMixin {
  TabController? tabController;

  String dropdownValue = 'March';
  List<String> list = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  late final TextEditingController? nameController;
  late final TextEditingController? phoneController;
  late final TextEditingController? emailController;
  late final TextEditingController? noteController;
  final reservationBloc = ReservationBloc()..add(ReservationFetchRestaurant());

  int peopleCount = 0;

  @override
  void initState() {
    // reservationBloc.add(ReservationFetchRestaurant());
    // _reservation.restaurantInfo = mockRestaurant;
    nameController = TextEditingController(text: 'THANH CONG');
    phoneController = TextEditingController(text: '0987654321');
    emailController = TextEditingController(text: 'thanhcong@gmail.com');
    noteController = TextEditingController(text: 'Hello WORLD');
    tabController = TabController(length: 3, vsync: this);
    tabController?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationBloc>.value(
      value: reservationBloc,
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
                child: Container(
                    color: Color(0xffF6EFE8),
                    width: 375,
                    height: 700,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildRestaurantInfo(context),
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Color(0xffffffff),
                            child: TabBar(
                              labelPadding: EdgeInsets.symmetric(horizontal: 1),
                              indicator: BoxDecoration(
                                  color: Color(0xffF6EFE8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelStyle: TextStyle(
                                  color: Color(0xffA93528),
                                  fontWeight: FontWeight.w600),
                              controller: tabController,
                              tabs: [
                                SizedBox(
                                  width: 200,
                                  child: Tab(
                                    text: 'Reservation',
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Tab(
                                    text: 'Menu',
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Tab(
                                    text: 'Reviews',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                _buildReservationBody(context),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    spacing: 10,
                                    children: [],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    spacing: 10,
                                    children: [],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ])));
          }
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo(
    BuildContext context,
  ) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        if (state is ReservationLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ReservationFetchRestaurantSuccess) {
          final restaurant = state.restaurant;
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                child: Image.asset(
                  'assets/images/img_banner.png',
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                    color: Color(0xffC4C4C433).withValues(alpha: 0.2),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant?.nameRestaurant ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            restaurant?.address ?? '',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Text(
                                'Now Open',
                                style: TextStyle(
                                    color: Color(0xff00c000),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(' - Closes at 10:00PM'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
        }

        return Container();
      },
    );
  }

  Widget _buildReservationBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Pick your date',
                style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 150,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                  elevation: 16,
                  underline: Container(height: 0),
                  dropdownColor: Color(0xffffffff),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(value)));
                  }).toList(),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(DateTime.now().year.toString())),
            ],
          ),
          UICount(
            title: 'How many people?',
            onCountChanged: (value) {
              peopleCount = value;
            },
          ),
          Text('Notes'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                  labelText: 'Notes', border: OutlineInputBorder()),
            ),
          ),
          Text('Your information'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: 'Phone number', border: OutlineInputBorder()),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLength: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          UICustomButton(
              text: "RESERVE",
              onPressed: () {
                Restaurant? restaurant;
                final state = reservationBloc.state;
                final state2 = context.read<ReservationBloc>().state;
                if (state2 is ReservationFetchRestaurantSuccess) {
                  restaurant = state2.restaurant;
                }
                print(
                    'asjfghafjg: ${nameController?.text} - ${emailController?.text} - ${phoneController?.text} - ${noteController?.text}');
                final Reservation data = Reservation(
                    createdDate: DateTime.now(),
                    userInfo: User(
                      name: nameController?.text,
                      email: emailController?.text,
                      phone: phoneController?.text,
                    ),
                    notes: noteController?.text,
                    peopleCount: peopleCount,
                    restaurantInfo: restaurant,
                );

                Navigator.pushNamed(context, RouteNamed.reservationConfirmPage,
                    arguments: {'data': data});
              }),
        ],
      ),
    );
  }
}
