import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/ajout_cat_gorie_model.dart';

/// A provider class for the AjoutCatGoriePage.
///
/// This provider manages the state of the AjoutCatGoriePage, including the
/// current ajoutCatGorieModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AjoutCatGorieProvider extends ChangeNotifier {
  TextEditingController categorynameController = TextEditingController();

  AjoutCatGorieModel ajoutCatGorieModelObj = AjoutCatGorieModel();

  @override
  void dispose() {
    super.dispose();
    categorynameController.dispose();
  }
}
