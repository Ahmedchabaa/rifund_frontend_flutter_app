import 'package:flutter/material.dart';

/// A provider class for the MotDePasseOublierScreen.
///
/// This provider manages the state of the MotDePasseOublierScreen, including the
/// current motDePasseOublierModelObj
// ignore_for_file: must_be_immutable
class MotDePasseOublierProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
