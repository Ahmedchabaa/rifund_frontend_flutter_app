
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import 'models/membre_rejoindre_model.dart';
import 'models/userprofile_item_model.dart';
import 'provider/membre_rejoindre_provider.dart';
import 'widgets/userprofile_item_widget.dart';

class MembreRejoindreScreen extends StatefulWidget {
  const MembreRejoindreScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MembreRejoindreScreenState createState() => MembreRejoindreScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MembreRejoindreProvider(),
      child: MembreRejoindreScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MembreRejoindreScreenState extends State<MembreRejoindreScreen> {
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
        appBar:  _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 37.v),
              _buildUserProfile(context)
            ],
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
              onTapImage(context);
            },
          ),
          AppbarTitle(
            text: "Membres à rejoindre".tr,
            margin: EdgeInsets.only(
              left: 50.h,
              top: 2.v,
              right: 40.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }
  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.h,
          right: 23.h,
        ),
        child: Consumer<MembreRejoindreProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 23.v,
                );
              },
              itemCount:
                  provider.membreRejoindreModelObj.userprofileItemList.length,
              itemBuilder: (context, index) {
                UserprofileItemModel model =
                    provider.membreRejoindreModelObj.userprofileItemList[index];
                return UserprofileItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget


  /// Navigates to the previous screen.
  onTapImage(BuildContext context) {
    NavigatorService.goBack();
  }
}
