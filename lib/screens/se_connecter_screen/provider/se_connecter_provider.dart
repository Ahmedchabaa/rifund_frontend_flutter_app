import 'package:flutter/material.dart';
import '../models/se_connecter_model.dart';

/// A provider class for the SeConnecterScreen.
///
/// This provider manages the state of the SeConnecterScreen, including the
/// current seConnecterModelObj
// ignore_for_file: must_be_immutable

class SeConnecterProvider extends ChangeNotifier {
  TextEditingController usernameoneController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  SeConnecterModel seConnecterModelObj = SeConnecterModel();

  bool isShowPassword = true;

  @override
  void dispose() {
    super.dispose();
    usernameoneController.dispose();
    passwordoneController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
