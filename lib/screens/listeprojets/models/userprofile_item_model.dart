import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemModel {
  UserprofileItemModel(
      {this.seventy, this.circleimage, this.titreduprojet, this.id}) {
    seventy = seventy ?? "70 %";
    circleimage = circleimage ?? ImageConstant.imgprofile;
    titreduprojet = titreduprojet ?? "Titre du projet ";
    id = id ?? "";
  }

  String? seventy;

  String? circleimage;

  String? titreduprojet;

  String? id;
}
