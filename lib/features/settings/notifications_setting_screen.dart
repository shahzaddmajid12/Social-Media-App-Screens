import 'package:flutter/material.dart';

class NotificationsSettingScreen extends StatelessWidget {
  const NotificationsSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: const Center(
        child: Text(
          "This is the Notifications settings screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
