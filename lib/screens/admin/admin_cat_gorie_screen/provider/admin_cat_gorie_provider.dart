import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/admin_cat_gorie_model.dart';

/// A provider class for the AdminCatGorieScreen.
///
/// This provider manages the state of the AdminCatGorieScreen, including the
/// current adminCatGorieModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AdminCatGorieProvider extends ChangeNotifier {
  AdminCatGorieModel adminCatGorieModelObj = AdminCatGorieModel();

  @override
  void dispose() {
    super.dispose();
  }
}
