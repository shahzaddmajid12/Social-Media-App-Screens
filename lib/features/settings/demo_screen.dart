import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Screen")),
      body: const Center(
        child: Text("This is the Demo Screen", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
