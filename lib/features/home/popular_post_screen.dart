import 'package:flutter/material.dart';

class PopularPostScreen extends StatefulWidget {
  const PopularPostScreen({super.key});

  @override
  State<PopularPostScreen> createState() => _PopularPostScreenState();
}

class _PopularPostScreenState extends State<PopularPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Popular Posts',
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center, // 👈 inline text alignment
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.newspaper, size: 100, color: Color(0xFF022D89)),
              SizedBox(height: 16),
              Text(
                "No Post Yet",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // 👈 inline text alignment
              ),
            ],
          ),
        ),
      ),
    );
  }
}
