import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/affichage_communaut_container_model.dart';

/// A provider class for the AffichageCommunautContainerScreen.
///
/// This provider manages the state of the AffichageCommunautContainerScreen, including the
/// current affichageCommunautContainerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AffichageCommunautContainerProvider extends ChangeNotifier {
  AffichageCommunautContainerModel affichageCommunautContainerModelObj =
      AffichageCommunautContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
