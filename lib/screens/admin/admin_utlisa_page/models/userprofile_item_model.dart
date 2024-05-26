/// This class is used in the [userprofile_item_widget] screen.

// ignore_for_file: must_be_immutable
class UserprofileItemModel {
  UserprofileItemModel({this.userName, this.userEmail, this.id}) {
    userEmail = userEmail ?? "imenmissaoui08@gmail.com";
    id = id ?? "";
  }

  String? userName;

  String? userEmail;

  String? id;

  
}
