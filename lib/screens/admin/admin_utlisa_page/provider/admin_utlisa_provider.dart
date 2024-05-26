import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/admin_utlisa_model.dart';
import '../models/userprofile_item_model.dart';

/// A provider class for the AdminUtlisaPage.
///
/// This provider manages the state of the AdminUtlisaPage, including the
/// current adminUtlisaModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AdminUtlisaProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  AdminUtlisaModel adminUtlisaModelObj = AdminUtlisaModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
