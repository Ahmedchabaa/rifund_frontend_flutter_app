import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/details_projet_model.dart';
import '../models/slider_item_model.dart';

/// A provider class for the DetailsProjetScreen.
///
/// This provider manages the state of the DetailsProjetScreen, including the
/// current detailsProjetModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class DetailsProjetProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  DetailsProjetModel detailsProjetModelObj = DetailsProjetModel();

  int sliderIndex = 0;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
