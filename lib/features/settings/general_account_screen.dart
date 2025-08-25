import 'package:flutter/material.dart';

class GeneralAccountScreen extends StatelessWidget {
  const GeneralAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("General Account")),
      body: const Center(
        child: Text(
          "This is the General Account screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
