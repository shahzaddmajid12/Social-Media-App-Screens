import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background video placeholder
          Positioned.fill(
            child: Image.asset(
              'assets/images/thumbnaildemo.png', // Replace with your image/video player
              fit: BoxFit.cover,
            ),
          ),

          // Top: Username
          Positioned(
            top: 40,
            left: 16,
            child: Text(
              '@inertiatours',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          // Right side icons
          Positioned(
            right: 12,
            bottom: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile icon with plus
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        'assets/profile.jpg',
                      ), // Replace with real asset
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add, size: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Icon(Icons.card_giftcard, color: Colors.white),
                SizedBox(height: 10),
                Column(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.white),
                    Text("0", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Icon(Icons.chat_bubble_outline, color: Colors.white),
                    Text("0", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.white),
                    Text("0", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),

          // Bottom left: description
          Positioned(
            left: 16,
            bottom: 40,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Looking for the wildest week of your life?',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  'Inertia Tours offers all inclusive college spring break p',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    // handle read more tap
                  },
                  child: Text(
                    'Read More',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Nav
    );
  }
}
