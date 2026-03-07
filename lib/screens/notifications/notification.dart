import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> notifications = [
      "Task assigned to you",
      "Project deadline tomorrow",
      "New comment added",
      "Task completed successfully",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),

      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {

          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}