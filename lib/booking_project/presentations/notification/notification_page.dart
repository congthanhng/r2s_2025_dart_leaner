

import 'package:flutter/material.dart';

import 'notification_data.dart';
import 'widgets/notification_card.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, String>> notifications =
      NotificationData.notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Mark as read",
              style: TextStyle(color: Colors.redAccent),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(
              title: notifications[index]["title"]!,
              time: notifications[index]["time"]!,
            );
          },
        ),
      ),
    );
  }
}




