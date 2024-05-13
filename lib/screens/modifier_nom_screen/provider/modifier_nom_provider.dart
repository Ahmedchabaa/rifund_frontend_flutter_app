import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/modifier_nom_model.dart';

/// A provider class for the ModifierNomScreen.
///
/// This provider manages the state of the ModifierNomScreen, including the
/// current modifierNomModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ModifierNomProvider extends ChangeNotifier {
  TextEditingController enternewusernamController = TextEditingController();

  ModifierNomModel modifierNomModelObj = ModifierNomModel();

  @override
  void dispose() {
    super.dispose();
    enternewusernamController.dispose();
  }
}
