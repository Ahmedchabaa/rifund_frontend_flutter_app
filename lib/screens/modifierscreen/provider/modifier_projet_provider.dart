import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/modifier_projet_model.dart';

/// A provider class for the ModifierProjetScreen.
///
/// This provider manages the state of the ModifierProjetScreen, including the
/// current modifierProjetModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ModifierProjetProvider extends ChangeNotifier {
  TextEditingController projectTitleController = TextEditingController();

  TextEditingController descriptionValueController = TextEditingController();

  TextEditingController projectImagesController = TextEditingController();

  TextEditingController budgetValueOneController = TextEditingController();

  TextEditingController durationOneController = TextEditingController();

  ModifierProjetModel modifierProjetModelObj = ModifierProjetModel();

  @override
  void dispose() {
    super.dispose();
    projectTitleController.dispose();
    descriptionValueController.dispose();
    projectImagesController.dispose();
    budgetValueOneController.dispose();
    durationOneController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in modifierProjetModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected1(dynamic value) {
    for (var element in modifierProjetModelObj.dropdownItemList1) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected2(dynamic value) {
    for (var element in modifierProjetModelObj.dropdownItemList2) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
