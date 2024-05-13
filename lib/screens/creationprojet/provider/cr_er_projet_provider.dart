import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/modelcrprojet.dart';


/// A provider class for the CrErProjetScreen.
///
/// This provider manages the state of the CrErProjetScreen, including the
/// current crErProjetModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CrErProjetProvider extends ChangeNotifier {
  TextEditingController projectTitleController = TextEditingController();

  TextEditingController descriptionValueController = TextEditingController();

  TextEditingController projectImagesController = TextEditingController();

  TextEditingController budgetValueController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  CrErProjetModel crErProjetModelObj = CrErProjetModel();

  @override
  void dispose() {
    super.dispose();
    projectTitleController.dispose();
    descriptionValueController.dispose();
    projectImagesController.dispose();
    budgetValueController.dispose();
    dateController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in crErProjetModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected1(dynamic value) {
    for (var element in crErProjetModelObj.dropdownItemList1) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
