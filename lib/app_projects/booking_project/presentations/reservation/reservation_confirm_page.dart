import 'package:dart_learner/app_projects/booking_project/core/route/route_named.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/reservation_model.dart';
import 'bloc/reservation_bloc.dart';
import 'components/ui_custom_button.dart';

class ReservationConfirmPage extends StatelessWidget {
  const ReservationConfirmPage({super.key, required this.data});

  final Reservation data;

  @override
  Widget build(BuildContext context) {
    print('ajsghj: ${data.restaurantInfo?.nameRestaurant}');
    return BlocProvider<ReservationBloc>(
      create: (context) => ReservationBloc(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return BlocListener<ReservationBloc, ReservationState>(
            listener: (context, state) {
              if (state is ReservationConfirmSuccess) {
                Navigator.pushReplacementNamed(context, RouteNamed.reservationSuccessPage,
                    arguments: <String, dynamic>{'reservation_id': state.id});
              }
            },
            child: SafeArea(
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
                                    '${data.restaurantInfo?.nameRestaurant}',
                                  ),
                                  _buildInfoRow(
                                    Icons.calendar_today,
                                    '${data.createdDate?.toIso8601String()}',
                                  ),
                                  _buildInfoRow(
                                      Icons.access_time, '18h00 - 18h30'),
                                  _buildInfoRow(Icons.people,
                                      '${data.peopleCount} People'),
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
                          BlocBuilder<ReservationBloc, ReservationState>(
                            builder: (context, state) {
                              if (state is ReservationLoading)
                                return CircularProgressIndicator();
                              return UICustomButton(
                                  text: "Confirm",
                                  onPressed: () {
                                    context
                                        .read<ReservationBloc>()
                                        .add(ReservationConfirmed(data));
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
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
              Text('${data.userInfo?.name}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${data.userInfo?.phone}'),
              Text('${data.userInfo?.email}'),
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
}
