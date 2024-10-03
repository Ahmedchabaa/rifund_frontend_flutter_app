import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rifund/screens/liste_de_communaut_page/liste_de_communaut_page.dart';
import 'package:rifund/screens/listeprojets/listeprojets.dart';
import 'package:rifund/screens/modifier_motdepasse_screen/modifier_motdepasse_screen.dart';
import 'package:rifund/screens/modifier_nom_screen/modifier_nom_screen.dart';

import '../../core/app_export.dart';
import '../../widgets/BottomNavBar.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_outlined_button.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: ProfileScreen(),
    );
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  TextEditingController _linkController = TextEditingController();
  List<String> links = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnTelevision(context),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 15.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "msg_information_personnelle".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 11.v),
                    _buildName(context),
                    _buildEmail(context),
                    _buildLinks(context),
                    _buildBio(context),
                    SizedBox(height: 13.v),
                    CustomOutlinedButton(
                      height: 32.v,
                      width: 192.h,
                      text: "msg_liste_des_projets".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListeDesProjetsPage()),
                        );
                      },
                    ),
                    SizedBox(height: 13.v),
                    CustomOutlinedButton(
                      height: 32.v,
                      width: 192.h,
                      text: "msg_liste_des_communaut".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListeDeCommunautPage()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget _buildColumnTelevision(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.h),
          bottomRight: Radius.circular(15.h),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            leadingWidth: 68.h,
            leading: GestureDetector(
              onTap: () {
                onTapArrowLeftOne(context);
              },
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                onPressed: () {
                  onTapArrowLeftOne(context);
                },
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle(
              text: "lbl_profile".tr,
            ),
            styleType: Style.bgFill_1,
          ),
          SizedBox(height: 25.v),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.image,
                allowMultiple: true,
              );
              if (result != null) {
                List<String> paths = result.paths.map((path) => path!).toList();
                List<String> fileNames =
                    result.files.map((file) => file.name ?? '').toList();
                print('Selected images: $paths');
                print('Selected image names: $fileNames');
              }
            },
          ),
          SizedBox(height: 16.v),
          Text(
            "msg_modifier_photo_profile".tr,
            style: CustomTextStyles.titleMediumWhiteA700,
          )
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 10.v,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "Nom :".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(width: 20),
          Text(
            "imen missaoui".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(width: 95),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModifierNomScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 10.v,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Email:".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(width: 20),
          Text(
            "imenmissaoui08@gmail.com".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(width: 35),
        ],
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    return Container(
      width: 327.h,
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 10.v,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Liens :".tr,
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(width: 55),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: links
                      .map((link) => Text(link, style: theme.textTheme.bodyLarge))
                      .toList(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 110),
              Text(
                "lbl_ajouter_lien".tr,
                style: theme.textTheme.bodyMedium,
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  _showAddLinkDialog(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showAddLinkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ajouter un lien"),
          content: TextField(
            controller: _linkController,
            decoration: InputDecoration(
              hintText: "Entrez l'URL du lien",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                String link = _linkController.text;
                if (_isValidUrl(link)) {
                  setState(() {
                    links.add(link);
                  });
                  _linkController.clear();
                  Navigator.of(context).pop();
                } else {
                  // Affichez un message d'erreur si l'URL est invalide
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Lien invalide. Veuillez entrer une URL valide."),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text("Ajouter"),
            ),
          ],
        );
      },
    );
  }

  // Fonction pour vérifier la validité de l'URL
  bool _isValidUrl(String url) {
    final Uri? uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  Widget _buildBio(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 10.v,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_mot_de_passe".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(width: 15),
          Text(
            "••••••••••".tr,
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModifierMotdepasseScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  onTapArrowLeftOne(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }
}
