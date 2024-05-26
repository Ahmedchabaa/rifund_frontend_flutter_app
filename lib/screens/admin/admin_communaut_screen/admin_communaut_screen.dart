import 'package:flutter/material.dart';
import 'package:rifund/screens/admin/profile_admin_page/profile_admin_page.dart';

import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import 'provider/admin_communaut_provider.dart';

class AdminCommunautScreen extends StatefulWidget {
  const AdminCommunautScreen({Key? key}) : super(key: key);

  @override
  AdminCommunautScreenState createState() => AdminCommunautScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminCommunautProvider(),
      child: const AdminCommunautScreen(),
    );
  }
}

class AdminCommunautScreenState extends State<AdminCommunautScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 45.v),
              _buildContent(context),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Row(
        children: [
          IconButton(
            icon:
                const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () => onTapArrowLeft(context),
          ),
          Expanded(
            child: AppbarTitle(
              text: "Gérer communauté".tr,
              margin: EdgeInsets.only(left: 70.h, top: 2.v, right: 79.h),
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: 337.h,
      margin: EdgeInsets.symmetric(horizontal: 11.h),
      padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 20.v),
      decoration: AppDecoration.outlineLightGreen.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage41,
            height: 108.v,
            width: 217.h,
            radius: BorderRadius.circular(20.h),
          ),
          SizedBox(height: 2.v),
          Text(
            "Mars 30 2024 10:25".tr,
            style: CustomTextStyles.bodyMediumLight,
          ),
          SizedBox(height: 21.v),
          Text(
            "حوايج العيد للصغيرات".tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 4.v),
          _buildRowDescription(context),
          SizedBox(height: 6.v),
          _buildRowNomDeProjet(context),
          SizedBox(height: 6.v),
          _buildActionButtons(context),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }

  Widget _buildRowDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 53.v),
            child: Text(
              "Description :".tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(width: 19.h),
          Expanded(
            child: Text(
              "حوايج العيد للصغيرات".tr,
              overflow: TextOverflow.visible,
              style: CustomTextStyles.bodyMediumBlack900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowNomDeProjet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 40.v),
            child: Text(
              "Nom de projet :".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(width: 19.h),
          Expanded(
            child: Text(
              "حوايج العيد للصغيرات".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumBlack900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            height: 36.v,
            width: 104.h,
            text: "Valider".tr,
            buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileAdminPage()),
              );
            },
          ),
          SizedBox(width: 9.h),
          CustomElevatedButton(
            height: 36.v,
            width: 104.h,
            text: "Refuser".tr,
            buttonStyle: CustomButtonStyles.fillGray,
            buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
            onPressed: () => onTapArrowLeft(context),
          ),
        ],
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
