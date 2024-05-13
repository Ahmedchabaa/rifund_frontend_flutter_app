import '../../../core/app_export.dart';

/// This class is used in the [listtext_item_widget] screen.
// ignore_for_file: must_be_immutable

class ListtextItemModel {
  ListtextItemModel({this.image, this.text, this.id}) {
    image = image ?? ImageConstant.imgImage28;
    text = text ?? "Enérgie";
    id = id ?? "";
  }

  String? image;

  String? text;

  String? id;
}
