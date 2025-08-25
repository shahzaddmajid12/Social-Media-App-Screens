import 'package:flutter/material.dart';

class MyInformationScreen extends StatelessWidget {
  const MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Information")),
      body: const Center(
        child: Text(
          "This is the MyInformation Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
