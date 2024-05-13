/// This class is used in the [communitycardsection_item_widget] screen.

// ignore_for_file: must_be_immutable
class CommunitycardsectionItemModel {
  CommunitycardsectionItemModel(
      {this.communityName, this.projectName, this.id}) {
    communityName = communityName ?? "Nom de communauté";
    projectName = projectName ?? "Nom de projet\nDate création";
    id = id ?? "";
  }
  String? communityName;

  String? projectName;

  String? id;
}
