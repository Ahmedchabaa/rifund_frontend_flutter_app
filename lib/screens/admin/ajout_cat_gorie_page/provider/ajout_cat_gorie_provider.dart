import 'package:flutter/material.dart';

class AjoutCatGorieProvider extends ChangeNotifier {
  TextEditingController? categorynameController = TextEditingController();

  // Method to validate the category name input
  String? validateCategoryName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le nom de catégorie ne peut pas être vide'; // Field is empty
    } else if (value.length < 3) {
      return 'Le nom de catégorie doit comporter au moins 3 caractères'; // Name is too short
    }
    return null; // Input is valid
  }

  // Dispose controllers when not needed
  @override
  void dispose() {
    categorynameController?.dispose();
    super.dispose();
  }
}
