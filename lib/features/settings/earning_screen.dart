import 'package:flutter/material.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Earning ")),
      body: const Center(
        child: Text(
          "This is the Earning screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
