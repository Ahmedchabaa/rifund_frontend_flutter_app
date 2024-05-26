import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rifund/screens/admin/admin_cat_gorie_screen/admin_cat_gorie_screen.dart';
import 'package:rifund/screens/admin/modifier_cat_gorie_page/provider/modifier_cat_gorie_provider.dart';

import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

class ModifierCatGoriePage extends StatefulWidget {
  const ModifierCatGoriePage({Key? key})
      : super(
          key: key,
        );

  @override
  ModifierCatGoriePageState createState() => ModifierCatGoriePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifierCatGorieProvider(),
      child: ModifierCatGoriePage(),
    );
  }
}

class ModifierCatGoriePageState extends State<ModifierCatGoriePage> {
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
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 54.v),
              Text("Modifier Catégorie".tr,
                  style: TextStyle(
                    color: Colors.lightGreen.shade600, // Setting text color
                    fontSize: 24.0, // Setting font size
                    fontWeight: FontWeight.w700, // Making text bold
                    fontStyle: FontStyle.italic,
                  )),
              SizedBox(height: 59.v),
              _buildAddCategory(context),
              SizedBox(height: 5.v)
            ],
          ),
        ),
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
            text: "Gérer Catégories".tr,
            margin: EdgeInsets.only(
              left: 60.h,
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
  Widget _buildAddCategory(BuildContext context) {
    return Container(
      width: 299.h,
      margin: EdgeInsets.only(right: 9.h),
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 47.v,
      ),
      decoration: AppDecoration.outlineLightGreen.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Selector<ModifierCatGorieProvider, TextEditingController?>(
              selector: (context, provider) => provider.categorynameController,
              builder: (context, categorynameController, child) {
                return CustomTextFormField(
                  controller: categorynameController,
                  hintText: "msg_nom_de_categorie".tr,
                  hintStyle: CustomTextStyles.bodyMediumThin,
                  textInputAction: TextInputAction.done,
                  suffix: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 15.v, 15.h, 30.v),
                    child: Icon(
                      Icons.extension,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 24.h,
                    top: 17.v,
                    bottom: 17.v,
                  ),
                  borderDecoration: TextFormFieldStyleHelper.outlineLightGreen,
                  filled: true,
                  fillColor: appTheme.whiteA700,
                );
              },
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Selector<ModifierCatGorieProvider, TextEditingController?>(
              selector: (context, provider) => provider.webUrlController,
              builder: (context, webUrlController, child) {
                return CustomTextFormField(
                  controller: webUrlController,
                  hintText: "selectionner votre images".tr,
                  hintStyle: CustomTextStyles.bodyMediumThin,
                  textInputAction: TextInputAction.done,
                  suffix: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
                    child: IconButton(
                      icon: const Icon(Icons.add_photo_alternate),
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          allowMultiple: true,
                        );
                        if (result != null) {
                          List<String> paths =
                              result.paths.map((path) => path!).toList();
                          // Handle the selected images here, you can save paths to use later
                          List<String> fileNames = result.files
                              .map((file) => file.name ?? '')
                              .toList();
                          print('Selected images: $paths');
                          print(
                              'Selected image names: $fileNames'); // Print the names of selected files
                          // You can use fileNames to display the names in the UI
                        }
                      },
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 24.h,
                    top: 17.v,
                    bottom: 17.v,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 50.v),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              right: 6.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  width: 104.h,
                  text: "Modifier".tr,
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminCatGorieScreen()),
                    );
                  },
                ),
                CustomElevatedButton(
                  width: 104.h,
                  text: "lbl_annuler".tr,
                  margin: EdgeInsets.only(left: 8.h),
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle: CustomTextStyles.titleSmallBlack900,
                  onPressed: () {
                    onTapArrowleftone(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
