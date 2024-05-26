import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rifund/screens/admin/admin_communaut_screen/admin_communaut_screen.dart';
import 'package:rifund/screens/admin/admin_projet_screen/admin_projet_screen.dart';
import 'package:rifund/screens/admin/admin_utlisa_page/admin_utlisa_page.dart';

import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_subtitle.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../../modifier_motdepasse_screen/modifier_motdepasse_screen.dart';
import '../../modifier_nom_screen/modifier_nom_screen.dart';
import 'provider/profile_admin_provider.dart';

class ProfileAdminPage extends StatefulWidget {
  const ProfileAdminPage({Key? key}) : super(key: key);

  @override
  ProfileAdminPageState createState() => ProfileAdminPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileAdminProvider(),
      child: ProfileAdminPage(),
    );
  }
}

class ProfileAdminPageState extends State<ProfileAdminPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // Set background color to white
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnTelevision(context),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 17.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "msg_information_personnelle".tr,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 11.v),
                    _buildName(context),
                    _buildEmail(context),
                    _buildMotdepass(context),
                    SizedBox(height: 13.v),
                    CustomOutlinedButton(
                      height: 32.v,
                      width: 192.h,
                      text: "Liste des utilisateurs".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminUtlisaPage()),
                        );
                      },
                    ),
                    SizedBox(height: 13.v),
                    CustomOutlinedButton(
                      height: 32.v,
                      width: 192.h,
                      text: "Liste des projets".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminProjetScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 13.v),
                    CustomOutlinedButton(
                      height: 32.v,
                      width: 192.h,
                      text: "Liste des communautés".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminCommunautScreen()),
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
                // Handle the selected images here, you can save paths to use later
                List<String> fileNames =
                    result.files.map((file) => file.name ?? '').toList();
                print('Selected images: $paths');
                print(
                    'Selected image names: $fileNames'); // Print the names of selected files
                // You can use fileNames to display the names in the UI
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
          SizedBox(
            width: 20,
          ),
          Text(
            "imen missaoui".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 95,
          ),
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
          SizedBox(
            width: 20,
          ),
          Text(
            "imenmissaoui08@gmail.com".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 35,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMotdepass(BuildContext context) {
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
            "Mot de passe :".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "*******".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 90,
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

  void onTapArrowLeftOne(BuildContext context) {}
}
