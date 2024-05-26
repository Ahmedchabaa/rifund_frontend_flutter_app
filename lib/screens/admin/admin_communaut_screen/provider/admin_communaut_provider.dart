import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/admin_communaut_model.dart';

/// A provider class for the AdminCommunautScreen.
///
/// This provider manages the state of the AdminCommunautScreen, including the
/// current adminCommunautModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AdminCommunautProvider extends ChangeNotifier {
  AdminCommunautModel adminCommunautModelObj = AdminCommunautModel();

  @override
  void dispose() {
    super.dispose();
  }
}
