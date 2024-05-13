import 'package:flutter/material.dart';
import '../models/splash_model.dart';

/// A provider class for the WelcomeScreen.
///
/// This provider manages the state of the WelcomeScreen, including the
/// current welcomeModelObj
// ignore_for_file: must_be_immutable

class SplashProvider extends ChangeNotifier {
  SplashModel SplashModelObj = SplashModel();

  @override
  void dispose() {
    super.dispose();
  }
}