import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rifund/screens/acceuil_client_page/acceuil_client_page.dart';
import 'package:rifund/screens/chat_box_screen/chat_box_screen.dart';

import '../../core/app_export.dart';
import '../welcome_screen/welcome_screen.dart';
import 'provider/loading_provider.dart'; // Import your next screen

class loadingscreen extends StatefulWidget {
  const loadingscreen({Key? key}) : super(key: key);

  @override
  _loadingScreenState createState() => _loadingScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: loadingscreen(),
    );
  }
}

class _loadingScreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 2 seconds (for example)
    Timer(Duration(seconds: 2), () {
      // After 2 seconds, navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              ChatBoxScreen() , //Replace with your next screen
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
           'https://lottie.host/f3825b57-3f94-4c82-9b17-07a7e653ee68/BqLwRiX0So.json'),
      ),
    );
  }
}
