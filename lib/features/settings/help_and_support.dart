import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: const Center(
        child: Text(
          "This is the Help & Support Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
