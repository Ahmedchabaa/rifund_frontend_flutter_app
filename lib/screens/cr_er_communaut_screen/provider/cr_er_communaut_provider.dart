import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/cr_er_communaut_model.dart';

/// A provider class for the CrErCommunautScreen.
///
/// This provider manages the state of the CrErCommunautScreen, including the
/// current crErCommunautModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CrErCommunautProvider extends ChangeNotifier {
  TextEditingController createCommunityController = TextEditingController();

  TextEditingController descriptionValueController = TextEditingController();

  TextEditingController webUrlController = TextEditingController();

  CrErCommunautModel crErCommunautModelObj = CrErCommunautModel();

  @override
  void dispose() {
    super.dispose();
    createCommunityController.dispose();
    descriptionValueController.dispose();
    webUrlController.dispose();
  }
}
