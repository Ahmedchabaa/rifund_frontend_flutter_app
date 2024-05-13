import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/userprofile_item_widget.dart';
import '../creationprojet/creationprojet.dart';
import 'models/userprofile_item_model.dart';
import 'provider/liste_des_projets_provider.dart';
// ignore_for_file: must_be_immutable

class ListeDesProjetsPage extends StatefulWidget {
  const ListeDesProjetsPage({Key? key})
      : super(
          key: key,
        );

  @override
  ListeDesProjetsPageState createState() => ListeDesProjetsPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListeDesProjetsProvider(),
      child: ListeDesProjetsPage(),
    );
  }
}

class ListeDesProjetsPageState extends State<ListeDesProjetsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 34.v),
            child: Container(
              width: SizeUtils.width,
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 17.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 30.h),
                      Text(
                        "msg_votre_liste_des".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(width: 5.h),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.black),
                        iconSize: 40,
                        alignment: Alignment.bottomRight,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CrErProjetScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40.v),
                  _buildUserProfile(context),
                  SizedBox(height: 27.v),
                  _buildUserProfile(context),
                  SizedBox(height: 27.v),
                  _buildUserProfile(context),
                  SizedBox(height: 27.v),
                  _buildUserProfile(context),
                  SizedBox(height: 27.v),
                  _buildUserProfile(context),
                  SizedBox(height: 27.v),
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
            text: "Liste de projets".tr,
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
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: Consumer<ListeDesProjetsProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.v,
                );
              },
              itemCount:
                  provider.listeDesProjetsModelObj.userprofileItemList.length,
              itemBuilder: (context, index) {
                UserprofileItemModel model =
                    provider.listeDesProjetsModelObj.userprofileItemList[index];
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

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
