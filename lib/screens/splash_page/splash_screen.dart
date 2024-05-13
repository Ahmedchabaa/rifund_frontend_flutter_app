import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/app_export.dart';
import '../welcome_screen/welcome_screen.dart';
import 'provider/splash_provider.dart'; // Import your next screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: SplashScreen(),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 2 seconds (for example)
    Timer(Duration(seconds: 4), () {
      // After 2 seconds, navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              WelcomeScreen(), // Replace with your next screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightGreen600,
      body: Center(
        child: Lottie.network(
            'https://lottie.host/44fa5b9f-e5f9-42ad-bd11-e871719523d9/CLbX4gG3n5.json'),
      ),
    );
  }
}
