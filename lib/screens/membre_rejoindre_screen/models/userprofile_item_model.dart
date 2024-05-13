import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemModel {
  UserprofileItemModel(
      {this.userImage, this.username, this.chartImage, this.id}) {
    userImage = userImage ?? ImageConstant.imgAccount;
    username = username ?? "Imen Missaoui";
    id = id ?? "";
  }

  String? userImage;

  String? username;

  String? chartImage;

  String? id;
}
