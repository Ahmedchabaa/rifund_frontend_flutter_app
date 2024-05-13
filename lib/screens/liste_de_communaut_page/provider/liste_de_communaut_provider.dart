import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/communitycardsection_item_model.dart';
import '../models/liste_de_communaut_model.dart';

/// A provider class for the ListeDeCommunautPage.
///
/// This provider manages the state of the ListeDeCommunautPage, including the
/// current listeDeCommunautModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ListeDeCommunautProvider extends ChangeNotifier {
  ListeDeCommunautModel listeDeCommunautModelObj = ListeDeCommunautModel();

  @override
  void dispose() {
    super.dispose();
  }
}
