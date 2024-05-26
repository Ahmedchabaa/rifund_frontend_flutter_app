import 'package:flutter/material.dart';

import '../models/affichagecategorie_model.dart';

class AffichageCategorieProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

 AffichageCategorietModel affichageCategorieModelObj =AffichageCategorietModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}