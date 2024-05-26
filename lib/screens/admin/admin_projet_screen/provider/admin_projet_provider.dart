import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/admin_projet_model.dart';

/// A provider class for the AdminProjetScreen.
///
/// This provider manages the state of the AdminProjetScreen, including the
/// current adminProjetModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AdminProjetProvider extends ChangeNotifier {
  AdminProjetModel adminProjetModelObj = AdminProjetModel();

  @override
  void dispose() {
    super.dispose();
  }
}
