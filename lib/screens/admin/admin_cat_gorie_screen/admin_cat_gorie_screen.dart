import 'package:flutter/material.dart';
import 'package:rifund/screens/admin/ajout_cat_gorie_page/ajout_cat_gorie_page.dart';
import 'package:rifund/screens/admin/modifier_cat_gorie_page/modifier_cat_gorie_page.dart';

import '../../../../widgets/app_bar/appbar_title.dart';
import '../../../core/app_export.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_icon_button.dart';
import 'provider/admin_cat_gorie_provider.dart';

class AdminCatGorieScreen extends StatefulWidget {
  const AdminCatGorieScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AdminCatGorieScreenState createState() => AdminCatGorieScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminCatGorieProvider(),
      child: AdminCatGorieScreen(),
    );
  }
}

class AdminCatGorieScreenState extends State<AdminCatGorieScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void onTapBtnPlusOne(BuildContext context) {}

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
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 28.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 23.h,
                            right: 17.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text(
                                  "Liste des catégories".tr,
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AjoutCatGoriePage()),
                                  );
                                },
                                child: Icon(Icons.add,
                                    color: Colors.white), // icon of the button
                                style: ElevatedButton.styleFrom(
                                  // styling the button
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(19),
                                  backgroundColor: Colors
                                      .lightGreen.shade600, // Button color
                                  // Splash color
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            right: 2.h,
                          ),
                          child: _buildField1(
                            context,
                            text: "Art et design".tr,
                          ),
                        ),
                        SizedBox(height: 25.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            right: 2.h,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 4.h),
                                child: _buildField1(
                                  context,
                                  text: "informatique et technologie".tr,
                                ),
                              ),
                              SizedBox(height: 25.v),
                              Padding(
                                padding: EdgeInsets.only(right: 4.h),
                                child: _buildField1(
                                  context,
                                  text: "informatique et technologie".tr,
                                ),
                              ),
                              SizedBox(height: 25.v),
                              Padding(
                                padding: EdgeInsets.only(right: 4.h),
                                child: _buildField1(
                                  context,
                                  text: "Art et design".tr,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
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
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              onTapArrowleftone(context);
            },
          ),
          AppbarTitle(
            text: "Gérer catégories".tr,
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
}

Widget _buildField1(
  BuildContext context, {
  required String text,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15.h,
      vertical: 13.v,
    ),
    decoration: AppDecoration.outlineLightgreen600.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder20,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 5.0, // Assuming .v is a custom extension
            bottom: 9.0, // Assuming .v is a custom extension
          ),
          child: Image.asset(
            'assets/images/sante.png', // Replace with your image asset path
            height: 24.0, // Adjust the height as needed
            width: 24.0, // Adjust the width as needed
          ),
        ),
        SizedBox(width: 8.0),
        Padding(
          padding: EdgeInsets.only(
            top: 7.0, // Assuming .v is a custom extension
            bottom: 9.0, // Assuming .v is a custom extension
          ), // Space between the image and text
          child: Text(
            text,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Spacer(),
        CustomIconButton(
          height: 32.0, // Assuming .adaptSize is a custom extension
          width: 32.0, // Assuming .adaptSize is a custom extension
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ModifierCatGoriePage()),
            );
          },
          child: Icon(Icons.note_add),
        ),
        SizedBox(width: 8.0), // Space between the icons
        CustomIconButton(
          height: 32.0, // Assuming .adaptSize is a custom extension
          width: 32.0, // Assuming .adaptSize is a custom extension
          onTap: () {
            deletedialog(context);
          },
          child: Icon(Icons.delete),
        ),
      ],
    ),
  );
}

void onTapArrowleftone(BuildContext context) {
  NavigatorService.goBack();
}

void onTapBtnPlusone(BuildContext context) {}

void deletedialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Voulez-vous supprimer cette catégorie"),
          actions: [
            TextButton(
              onPressed: () {
                // Perform delete operation here
                Navigator.of(context).pop();
              },
              child: Text("Oui"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annuler"),
            ),
          ],
        );
      });
}
