import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
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
                    ),
                    SizedBox(height: 13.v),
                    CustomOutlinedButton(
                      height: 32.v,
                      width: 192.h,
                      text: "msg_liste_des_communaut".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                    ),
                    SizedBox(height: 5.v)
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
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade600,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.h),
          bottomRight: Radius.circular(15.h),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5.v),
          CustomAppBar(
            leadingWidth: 68.h,
            leading: GestureDetector(
              onTap: () {
                onTapArrowLeftOne(context);
              },
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle(
              text: "lbl_profile".tr,
            ),
            styleType: Style.bgOutline,
          ),
          SizedBox(height: 25.v),
          Icon(
            Icons.person,
            size: 50,
            color: Colors.white,
          ),
          SizedBox(height: 16.v),
          Text(
            "msg_modifier_photo_profile".tr,
            style: CustomTextStyles.titleSmallPrimarySemiBold,
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
        vertical: 13.v,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "Nom :".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            width: 35,
          ),
          Text(
            "imen missaoui".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 200,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: () {
              // Add your onPressed logic here
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
        vertical: 13.v,
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
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "imenmissaoui08@gmail.com".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 172,
          ),
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
        vertical: 13.v,
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
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                width: 125,
              ),
              Text(
                "lbl_facebook_com".tr,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "lbl_linkedline_com".tr,
            style: theme.textTheme.bodyLarge,
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
              Text(
                "lbl_ajouter_lien".tr,
                style: theme.textTheme.bodyMedium,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 13.v,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "Mot de passe:".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            width: 95,
          ),
          Text(
            "lbl2".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            alignment: Alignment.topRight,
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ],
      ),
    );
  }

  void onTapArrowLeftOne(BuildContext context) {
    // Implement your navigation logic here
  }

  void onTapBio(BuildContext context) {
    // Implement your navigation logic here
  }
}
