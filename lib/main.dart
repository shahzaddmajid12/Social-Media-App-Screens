import 'package:flutter/material.dart';
import 'splash_screen.dart';
// import 'login_screen.dart';
// import 'home.dart';
// import 'signup.dart';
// import 'notification_screen.dart';
// import 'reels_screen.dart';
// import 'trending_screen.dart';
// import 'settings_screen.dart';
import 'package:splash_app/features/home/home.dart';
import 'package:splash_app/features/auth/signup.dart';
import 'package:splash_app/features/auth/login_screen.dart';
import 'package:splash_app/features/notification/notification_screen.dart';
import 'package:splash_app/features/trending/trending_screen.dart';
import 'package:splash_app/features/settings/settings_screen.dart';

void main() {
  runApp(const MyApp()); // 👈 Use MyApp, not MaterialApp directly
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash App',
      debugShowCheckedModeBanner: false, // 👈 This removes the debug banner
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // 👈 Start from splash
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
