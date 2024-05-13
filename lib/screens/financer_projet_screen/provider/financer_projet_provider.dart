import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/financer_projet_model.dart';

/// A provider class for the FinancerProjetScreen.
///
/// This provider manages the state of the FinancerProjetScreen, including the
/// current financerProjetModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FinancerProjetProvider extends ChangeNotifier {
  TextEditingController fullNameOneController = TextEditingController();

  TextEditingController numberOneController = TextEditingController();
  TextEditingController codescretController = TextEditingController();
  TextEditingController dateexpController = TextEditingController();

  TextEditingController budgetValueOneController = TextEditingController();

  FinancerProjetModel financerProjetModelObj = FinancerProjetModel();

  @override
  void dispose() {
    super.dispose();
    fullNameOneController.dispose();
    numberOneController.dispose();
    codescretController.dispose();
    dateexpController.dispose();
    budgetValueOneController.dispose();
  }
      onSelected(dynamic value) {
    for (var element in financerProjetModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected1(dynamic value) {
    for (var element in financerProjetModelObj.dropdownItemList1) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  onSelected2(dynamic value) {
    for (var element in financerProjetModelObj.dropdownItemList2) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();}

}
