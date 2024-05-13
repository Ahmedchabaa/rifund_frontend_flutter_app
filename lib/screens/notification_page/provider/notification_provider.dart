import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/notification_model.dart';

/// A provider class for the NotificationPage.
///
/// This provider manages the state of the NotificationPage, including the
/// current notificationModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationProvider extends ChangeNotifier {
  NotificationModel notificationModelObj = NotificationModel();

  @override
  void dispose() {
    super.dispose();
  }
}
