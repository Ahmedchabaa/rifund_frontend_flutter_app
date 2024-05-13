import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/modifier_communaut_model.dart';

/// A provider class for the ModifierCommunautScreen.
///
/// This provider manages the state of the ModifierCommunautScreen, including the
/// current modifierCommunautModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ModifierCommunautProvider extends ChangeNotifier {
  TextEditingController createCommunityController = TextEditingController();

  TextEditingController descriptionValueController = TextEditingController();

  TextEditingController webUrlController = TextEditingController();

  ModifierCommunautModel modifierCommunautModelObj = ModifierCommunautModel();

  @override
  void dispose() {
    super.dispose();
    createCommunityController.dispose();
    descriptionValueController.dispose();
    webUrlController.dispose();
  }
}
