import 'package:flutter/material.dart';

class GoProAccountScreen extends StatelessWidget {
  const GoProAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Go Pro Account")),
      body: const Center(
        child: Text(
          "This is the Go Pro Account Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
