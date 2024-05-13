import 'package:flutter/material.dart';

import '../models/acceuil_client_model.dart';

/// A provider class for the AcceuilClientPage.
///
/// This provider manages the state of the AcceuilClientPage, including the
/// current acceuilClientModelObj
// ignore_for_file: must_be_immutable

class AcceuilClientProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  AcceuilClientModel acceuilClientModelObj = AcceuilClientModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
