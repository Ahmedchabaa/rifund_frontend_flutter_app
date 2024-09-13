import 'package:flutter/material.dart';

class SeConnecterProvider with ChangeNotifier {
  // Controllers
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordoneController = TextEditingController();

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordoneController?.dispose();
    super.dispose();
  }
}
