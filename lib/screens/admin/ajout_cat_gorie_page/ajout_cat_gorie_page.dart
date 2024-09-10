import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rifund/screens/admin/admin_cat_gorie_screen/admin_cat_gorie_screen.dart';

import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'provider/ajout_cat_gorie_provider.dart'; // ignore_for_file: must_be_immutable

class AjoutCatGoriePage extends StatefulWidget {
  const AjoutCatGoriePage({Key? key})
      : super(
          key: key,
        );

  @override
  AjoutCatGoriePageState createState() => AjoutCatGoriePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AjoutCatGorieProvider(),
      child: AjoutCatGoriePage(),
    );
  }
}

class AjoutCatGoriePageState extends State<AjoutCatGoriePage> {
  final _formKey = GlobalKey<FormState>(); // Form key to manage validation

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
          child: Form(
            key: _formKey, // Wrap form elements with Form widget
            child: Column(
              children: [
                SizedBox(height: 54.v),
                Text("msg_ajouter_cat_gorie".tr,
                    style: TextStyle(
                      color: Colors.lightGreen.shade600,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    )),
                SizedBox(height: 59.v),
                _buildAddCategory(context),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
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
            child: Selector<AjoutCatGorieProvider, TextEditingController?>(
              selector: (context, provider) => provider.categorynameController,
              builder: (context, categorynameController, child) {
                return CustomTextFormField(
                  controller: categorynameController,
                  hintText: "msg_nom_de_categorie".tr,
                  hintStyle: CustomTextStyles.bodyMediumThin,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    return context
                        .read<AjoutCatGorieProvider>()
                        .validateCategoryName(value); // Call validation
                  },
                  suffix: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 20.h),
                    child: Icon(Icons.extension),
                  ),
                  suffixConstraints: BoxConstraints(maxHeight: 50.v),
                  contentPadding: EdgeInsets.only(left: 24.h, top: 17.v, bottom: 17.v),
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
            child: Selector<AjoutCatGorieProvider, TextEditingController?>(
              selector: (context, provider) => provider.categorynameController,
              builder: (context, webUrlController, child) {
                return CustomTextFormField(
                  controller: webUrlController,
                  hintText: "selectionner votre images".tr,
                  hintStyle: CustomTextStyles.bodyMediumThin,
                  textInputAction: TextInputAction.done,
                  suffix: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
                    child: IconButton(
                      icon: const Icon(Icons.add_photo_alternate),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          allowMultiple: true,
                        );
                        if (result != null) {
                          List<String> paths = result.paths.map((path) => path!).toList();
                          List<String> fileNames = result.files.map((file) => file.name ?? '').toList();
                          print('Selected images: $paths');
                          print('Selected image names: $fileNames');
                        }
                      },
                    ),
                  ),
                  suffixConstraints: BoxConstraints(maxHeight: 50.v),
                  contentPadding: EdgeInsets.only(left: 24.h, top: 17.v, bottom: 17.v),
                );
              },
            ),
          ),
          SizedBox(height: 40.v),
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
                  height: 40.v,
                  text: "lbl_valider".tr,
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminCatGorieScreen()),
                      );
                    }
                  },
                ),
                CustomElevatedButton(
                  width: 104.h,
                  height: 40.v,
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

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
