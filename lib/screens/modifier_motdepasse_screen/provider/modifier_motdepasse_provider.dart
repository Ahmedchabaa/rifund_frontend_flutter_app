import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/app_export.dart';
import '../models/modifier_motdepasse_model.dart';

/// A provider class for the ModifierMotdepasseScreen.
///
/// This provider manages the state of the ModifierMotdepasseScreen, including the
/// current modifierMotdepasseModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ModifierMotdepasseProvider extends ChangeNotifier {
  TextEditingController enterPasswordController = TextEditingController();

  TextEditingController enterPassword1Controller = TextEditingController();
  TextEditingController RepetezLeController=TextEditingController();

  ModifierMotdepasseModel modifierMotdepasseModelObj =
      ModifierMotdepasseModel();

  @override
  void dispose() {
    super.dispose();
    enterPasswordController.dispose();
    enterPassword1Controller.dispose();
    RepetezLeController.dispose(); 
     }
}
