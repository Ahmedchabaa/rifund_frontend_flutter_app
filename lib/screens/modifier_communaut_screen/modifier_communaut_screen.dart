import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rifund/screens/affichage_communaut_page/affichage_communaut_page.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/modifier_communaut_provider.dart';

class ModifierCommunautScreen extends StatefulWidget {
  const ModifierCommunautScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ModifierCommunautScreenState createState() => ModifierCommunautScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifierCommunautProvider(),
      child: ModifierCommunautScreen(),
    );
  }
}

class ModifierCommunautScreenState extends State<ModifierCommunautScreen> {
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
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 54.v),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 33.v,
                ),
                decoration: AppDecoration.outlinePrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 34.v),
                    SizedBox(
                      width: 156.h,
                      child: Text(
                        "Modifier Communauté".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(height: 20.v),
                    _buildCreateCommunity(context),
                    SizedBox(height: 16.v),
                    _buildDescriptionValue(context),
                    SizedBox(height: 17.v),
                    _buildWebUrl(context),
                    SizedBox(height: 29.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        right: 18.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCreateButton(context),
                          _buildCancelButton(context)
                        ],
                      ),
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
            text: "Modifier Communauté".tr,
            margin: EdgeInsets.only(
              left: 50.h,
              top: 2.v,
              right: 60.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  /// Section Widget
  Widget _buildCreateCommunity(BuildContext context) {
    return Selector<ModifierCommunautProvider, TextEditingController?>(
      selector: (context, provider) => provider.createCommunityController,
      builder: (context, createCommunityController, child) {
        return CustomTextFormField(
          controller: createCommunityController,
          hintText: "Modifier le nom de communauté".tr,
          suffix: Container(
            padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
            child: Icon(
              Icons.people,
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDescriptionValue(BuildContext context) {
    return Selector<ModifierCommunautProvider, TextEditingController?>(
      selector: (context, provider) => provider.descriptionValueController,
      builder: (context, descriptionValueController, child) {
        return CustomTextFormField(
          controller: descriptionValueController,
          hintText: "lbl_description".tr,
        );
      },
    );
  }

  /// Section Widget
  /// Section Widget
  Widget _buildWebUrl(BuildContext context) {
    return Selector<ModifierCommunautProvider, TextEditingController?>(
      selector: (context, provider) => provider.webUrlController,
      builder: (context, webUrlController, child) {
        return Stack(
          children: [
            CustomTextFormField(
              controller: webUrlController,
              hintText: "selectionner images".tr,
              textInputAction: TextInputAction.done,
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.image,
                    allowMultiple: true,
                  );
                  if (result != null) {
                    List<String> paths =
                        result.paths.map((path) => path!).toList();
                    // Handle the selected images here, you can save paths to use later
                    List<String> fileNames =
                        result.files.map((file) => file.name ?? '').toList();
                    print('Selected images: $paths');
                    print(
                        'Selected image names: $fileNames'); // Print the names of selected files
                    // You can use fileNames to display the names in the UI
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
                  child: Icon(
                    Icons.add_photo_alternate,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCreateButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 36.v,
        width: 117.h,
        text: "Modifier".tr,
        margin: EdgeInsets.only(right: 12.h),
        buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AffichageCommunautPage()),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCancelButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 36.v,
        width: 117.h,
        text: "lbl_annuler".tr,
        margin: EdgeInsets.only(left: 12.h),
        buttonStyle: CustomButtonStyles.fillBlueGray,
        buttonTextStyle: theme.textTheme.labelLarge!,
        onPressed: () {
          onTapImage(context);
        },
      ),
    );
  }

  /// Section Widget

  void onTapImage(BuildContext context) {
    NavigatorService.goBack();
  }
}
