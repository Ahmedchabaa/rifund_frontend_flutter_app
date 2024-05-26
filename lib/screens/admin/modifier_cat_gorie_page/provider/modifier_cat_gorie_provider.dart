import 'package:flutter/material.dart';
import 'package:rifund/screens/admin/modifier_cat_gorie_page/models/modifier_cat_gorie_model.dart';
import '../../../../core/app_export.dart';


/// A provider class for the AjoutCatGoriePage.
///
/// This provider manages the state of the AjoutCatGoriePage, including the
/// current ajoutCatGorieModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ModifierCatGorieProvider extends ChangeNotifier {
  TextEditingController categorynameController = TextEditingController();
TextEditingController webUrlController = TextEditingController();
  ModifierCatGorieModel modifierCatGorieModelObj = ModifierCatGorieModel();

  @override
  void dispose() {
    super.dispose();
    categorynameController.dispose();
        webUrlController.dispose();
  }
}
