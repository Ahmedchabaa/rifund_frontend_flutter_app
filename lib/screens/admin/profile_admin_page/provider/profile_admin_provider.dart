import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/profile_admin_model.dart';

/// A provider class for the ProfileAdminPage.
///
/// This provider manages the state of the ProfileAdminPage, including the
/// current profileAdminModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ProfileAdminProvider extends ChangeNotifier {
  ProfileAdminModel profileAdminModelObj = ProfileAdminModel();

  @override
  void dispose() {
    super.dispose();
  }
}
