import 'package:flutter/material.dart';
import 'package:rifund/screens/loading_page/models/loading_model.dart';
import '../models/loading_model.dart';

/// A provider class for the WelcomeScreen.
///
/// This provider manages the state of the WelcomeScreen, including the
/// current welcomeModelObj
// ignore_for_file: must_be_immutable

class SplashProvider extends ChangeNotifier {
  loadingModel SplashModelObj = loadingModel();

  @override
  void dispose() {
    super.dispose();
  }
}