import 'package:flutter/material.dart';

class InvitationLinksScreen extends StatelessWidget {
  const InvitationLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invitation")),
      body: const Center(
        child: Text(
          "This is the Invitation Links Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
