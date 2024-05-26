import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/affichage_communaut_model.dart';

/// A provider class for the AffichageCommunautPage.
///
/// This provider manages the state of the AffichageCommunautPage, including the
/// current affichageCommunautModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AffichageCommunautProvider extends ChangeNotifier {
  AffichageCommunautModel affichageCommunautModelObj =
      AffichageCommunautModel();

  @override
  void dispose() {
    super.dispose();
  }
}
