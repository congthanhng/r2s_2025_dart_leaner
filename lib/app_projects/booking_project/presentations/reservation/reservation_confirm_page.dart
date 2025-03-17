import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:flutter/material.dart';

import '../../models/reservation_model.dart';
import 'components/ui_custom_button.dart';

class ReservationConfirmPage extends StatelessWidget {
  const ReservationConfirmPage({super.key, required this.data});

  final Reservation data;
  @override
  Widget build(BuildContext context) {
    print('ajsghj: ${data.createdDate}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/img_banner.png', height: 200),
              Container(
                width: 377,
                height: 583,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Reservation",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 372,
                        height: 173,
                        decoration: BoxDecoration(
                          color: Color(0xffF6EFE8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              Icons.location_on,
                              'Ann BBQ Su Van Hanh\nNo. 116 Su Van Hanh, Ward 12, Dist 10, HCM',
                            ),
                            _buildInfoRow(
                              Icons.calendar_today,
                              'Wednesday, 25th Sep 2021',
                            ),
                            _buildInfoRow(Icons.access_time, '18h00 - 18h30'),
                            _buildInfoRow(Icons.people, '2 People'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 372,
                        height: 91,
                        decoration: BoxDecoration(
                          color: Color(0xffF6EFE8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _buildUserInfo(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildDepositInfo(),
                    ),
                    UICustomButton(
                        text: "Confirm",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteNamed.reservationSuccessPage);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoRow(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(width: 8),
        Expanded(child: Text(text, style: TextStyle(fontSize: 14))),
      ],
    ),
  );
}

Widget _buildUserInfo() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mary Nguyen', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('0987657992'),
            Text('mary.nguyen@gmail.com'),
          ],
        ),
      ],
    ),
  );
}

Widget _buildDepositInfo() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.orange.shade100,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your deposit is 200,000VND',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Please pay within 30 minutes, if not, your reservation will be canceled automatically.',
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
      ],
    ),
  );
}
