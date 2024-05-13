import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/membre_rejoindre_model.dart';
import '../models/userprofile_item_model.dart';

/// A provider class for the MembreRejoindreScreen.
///
/// This provider manages the state of the MembreRejoindreScreen, including the
/// current membreRejoindreModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MembreRejoindreProvider extends ChangeNotifier {
  MembreRejoindreModel membreRejoindreModelObj = MembreRejoindreModel();

  @override
  void dispose() {
    super.dispose();
  }
}
