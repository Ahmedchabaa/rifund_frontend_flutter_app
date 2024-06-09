import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_search_view.dart';
import '../profile_admin_page/profile_admin_page.dart';
import 'models/userprofile_item_model.dart';
import 'provider/admin_utlisa_provider.dart';
import 'widgets/userprofile_item_widget.dart';

class AdminUtlisaPage extends StatefulWidget {
  const AdminUtlisaPage({Key? key}) : super(key: key);

  @override
  AdminUtlisaPageState createState() => AdminUtlisaPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminUtlisaProvider(),
      child: AdminUtlisaPage(),
    );
  }
}

class AdminUtlisaPageState extends State<AdminUtlisaPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: Container(
            padding: EdgeInsets.only(top: 24.v),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 9.h, right: 9.h),
                    child:
                        Selector<AdminUtlisaProvider, TextEditingController?>(
                      selector: (context, provider) =>
                          provider.searchController,
                      builder: (context, searchController, child) {
                        return CustomSearchView(
                          controller: searchController,
                          hintText: "Tous les utilisateurs".tr,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 0),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: AppDecoration.outlineLightgreen600.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder13,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Selectionner tout".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 11),
                      SingleChildScrollView(
                        child: _buildUserProfile(context),
                      ),
                      SizedBox(height: 64),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomElevatedButton(
                              height: 36,
                              width: 104,
                              text: "Valider",
                              buttonTextStyle:
                                  CustomTextStyles.bodyMediumBlack900,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileAdminPage()),
                                );
                              },
                            ),
                            SizedBox(width: 9), // Adding space between buttons
                            CustomElevatedButton(
                              height: 36,
                              width: 104,
                              text: "Refuser",
                              buttonStyle: CustomButtonStyles.fillGray,
                              buttonTextStyle:
                                  CustomTextStyles.bodyMediumBlack900,
                              onPressed: () {
                                onTapArrowleftone(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              onTapArrowleftone(context);
            },
          ),
          AppbarTitle(
            text: "Gérer Utilisateurs".tr,
            margin: EdgeInsets.only(
              left: 80.h,
              top: 2.v,
              right: 79.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Consumer<AdminUtlisaProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 36.v,
              );
            },
            itemCount: provider.adminUtlisaModelObj.userprofileItemList.length,
            itemBuilder: (context, index) {
              UserprofileItemModel model =
                  provider.adminUtlisaModelObj.userprofileItemList[index];
              return UserprofileItemWidget(model);
            },
          );
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
