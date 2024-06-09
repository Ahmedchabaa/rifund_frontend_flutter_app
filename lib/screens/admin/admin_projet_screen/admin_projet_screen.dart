import 'package:flutter/material.dart';
import 'package:rifund/screens/admin/profile_admin_page/profile_admin_page.dart';

import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import 'provider/admin_projet_provider.dart';

class AdminProjetScreen extends StatefulWidget {
  const AdminProjetScreen({Key? key}) : super(key: key);

  @override
  AdminProjetScreenState createState() => AdminProjetScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminProjetProvider(),
      child: const AdminProjetScreen(),
    );
  }
}

class AdminProjetScreenState extends State<AdminProjetScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 337.h,
                margin: EdgeInsets.symmetric(horizontal: 11.h),
                padding: EdgeInsets.all(10.h),
                decoration: AppDecoration.outlineLightGreen.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage41118x237,
                      height: 118.v,
                      width: 237.h,
                      radius: BorderRadius.circular(20.h),
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 10.v),
                    Center(
                      child: Text(
                        "حوايج العيد للصغيرات".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 15.v),
                    _buildInfoRow(
                        context, "Description :", "حوايج العيد للصغيرات"),
                    SizedBox(height: 15.v),
                    _buildInfoRow(context, "Localisation :", "Tunisie"),
                    SizedBox(height: 22.v),
                    _buildInfoRow(context, "Date :", "mars 30 ,2024,10:25 "),
                    SizedBox(height: 15.v),
                    _buildInfoRow(context, "Catégorie :", "social"),
                    SizedBox(height: 15.v),
                    _buildInfoRow(context, "Budget :", "2000 DT"),
                    SizedBox(height: 19.v),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                            width: 104.h,
                            height: 45.v,
                            text: "Valider".tr,
                            buttonTextStyle:
                                CustomTextStyles.bodyMediumBlack900!,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileAdminPage()),
                              );
                            },
                          ),
                          CustomElevatedButton(
                            width: 104.h,
                            height: 45.v,
                            text: "Refuser".tr,
                            margin: EdgeInsets.only(left: 8.h),
                            buttonStyle: CustomButtonStyles.fillGray,
                            buttonTextStyle:
                                CustomTextStyles.bodyMediumBlack900,
                            onPressed: () {
                              onTapArrowleftone(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.v),
                  ],
                ),
              ),
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
            onPressed: () {
              onTapArrowleftone(context);
            },
          ),
          AppbarTitle(
            text: "Gérer Projets".tr,
            margin: EdgeInsets.only(left: 80.h, right: 79.h),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  void onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(left: 12.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: Text(
              label.tr,
              style: CustomTextStyles.titleLargeMedium,
            ),
          ),
          SizedBox(width: 8.h),
          Text(
            value.tr,
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
