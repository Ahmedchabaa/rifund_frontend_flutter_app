import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/chat_box_model.dart';

/// A provider class for the ChatBoxScreen.
///
/// This provider manages the state of the ChatBoxScreen, including the
/// current chatBoxModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChatBoxProvider extends ChangeNotifier {
  TextEditingController greetingimenController = TextEditingController();

  TextEditingController greetinghiimController = TextEditingController();

  TextEditingController okdaccordController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  ChatBoxModel chatBoxModelObj = ChatBoxModel();

  @override
  void dispose() {
    super.dispose();
    greetingimenController.dispose();
    greetinghiimController.dispose();
    okdaccordController.dispose();
    messageController.dispose();
  }
}
