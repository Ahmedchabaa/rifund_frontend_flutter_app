import 'package:flutter/material.dart';
import '../models/cr_er_un_compte_model.dart';

/// A provider class for the CrErUnCompteScreen.
///
/// This provider manages the state of the CrErUnCompteScreen, including the
/// current crErUnCompteModelObj
// ignore_for_file: must_be_immutable

class CrErUnCompteProvider extends ChangeNotifier {
  TextEditingController imageOneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordOneController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  CrErUnCompteModel crErUnCompteModelObj = CrErUnCompteModel();

  bool isShowPassword = true;

  bool isShowPassword1 = true;

  @override
  void dispose() {
    super.dispose();
    imageOneController.dispose();
    emailController.dispose();
    passwordOneController.dispose();
    confirmPasswordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changePasswordVisibility1() {
    isShowPassword1 = !isShowPassword1;
    notifyListeners();
  }
}
