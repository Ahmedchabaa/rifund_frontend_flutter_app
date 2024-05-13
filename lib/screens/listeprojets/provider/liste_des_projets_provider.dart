import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/liste_des_projets_model.dart';
import '../models/userprofile_item_model.dart';

/// A provider class for the ListeDesProjetsPage.
///
/// This provider manages the state of the ListeDesProjetsPage, including the
/// current listeDesProjetsModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ListeDesProjetsProvider extends ChangeNotifier {
  ListeDesProjetsModel listeDesProjetsModelObj = ListeDesProjetsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
