import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/modifier_projet_model.dart';
import 'provider/modifier_projet_provider.dart';

class ModifierProjetScreen extends StatefulWidget {
  const ModifierProjetScreen({super.key});

  @override
  ModifierProjetScreenState createState() => ModifierProjetScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifierProjetProvider(),
      child: const ModifierProjetScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ModifierProjetScreenState extends State<ModifierProjetScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Container(
                margin: EdgeInsets.only(
                  left: 26.h,
                  right: 22.h,
                  bottom: 20.v,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 15.v,
                ),
                decoration: AppDecoration.outlinePrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.v),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0.h),
                              child: Text(
                                "Remplir les champs que vous devez modifier".tr,
                                style: CustomTextStyles.titleSmallPrimary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18.v),
                    _buildProjectTitle(context),
                    SizedBox(height: 18.v),
                    _buildDescriptionValue(context),
                    SizedBox(height: 18.v),
                    _buildProjectImages(context),
                    SizedBox(height: 18.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildBudgetValueOne(context),
                          Selector<ModifierProjetProvider,
                              ModifierProjetModel?>(
                            selector: (context, provider) =>
                                provider.modifierProjetModelObj,
                            builder: (context, modifierProjetModelObj, child) {
                              return CustomDropDown(
                                width: 116.h,
                                icon: Container(
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgcrprojet,
                                    height: 15.adaptSize,
                                    width: 15.adaptSize,
                                  ),
                                ),
                                hintText: "lbl_devise".tr,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h,
                                  vertical: 11.v,
                                ),
                                items:
                                    modifierProjetModelObj?.dropdownItemList ??
                                        [],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 18.v),
                    _buildDurationOne(context),
                    SizedBox(height: 18.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      child: Selector<ModifierProjetProvider,
                          ModifierProjetModel?>(
                        selector: (context, provider) =>
                            provider.modifierProjetModelObj,
                        builder: (context, modifierProjetModelObj, child) {
                          return CustomDropDown(
                            icon: Container(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgcrprojet,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                              ),
                            ),
                            hintText: "lbl_localisation".tr,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 11.v,
                            ),
                            items:
                                modifierProjetModelObj?.dropdownItemList1 ?? [],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 18.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      child: Selector<ModifierProjetProvider,
                          ModifierProjetModel?>(
                        selector: (context, provider) =>
                            provider.modifierProjetModelObj,
                        builder: (context, modifierProjetModelObj, child) {
                          return CustomDropDown(
                            icon: Container(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgcrprojet,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                              ),
                            ),
                            hintText: "lbl_cat_gorie".tr,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 11.v,
                            ),
                            items:
                                modifierProjetModelObj?.dropdownItemList2 ?? [],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 28.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 79.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildModifier(context),
                            _buildAnnuler(context)
                          ],
                        ),
                      ),
                    )
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
              onTapArrowleftone(context);
            },
          ),
          AppbarTitle(
            text: "Modifier projet".tr,
            margin: EdgeInsets.only(
              left: 31.h,
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
  Widget _buildProjectTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.projectTitleController,
        builder: (context, projectTitleController, child) {
          return CustomTextFormField(
            controller: projectTitleController,
            hintText: "lbl_titre_du_projet".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildDescriptionValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.descriptionValueController,
        builder: (context, descriptionValueController, child) {
          return CustomTextFormField(
            controller: descriptionValueController,
            hintText: "lbl_description".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildProjectImages(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.projectImagesController,
        builder: (context, projectImagesController, child) {
          return Stack(
            children: [
              CustomTextFormField(
                controller: projectImagesController,
                hintText: "msg_images_du_projet".tr,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 11.v,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    // Action à effectuer lorsque l'icône est cliquée
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBudgetValueOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Selector<ModifierProjetProvider, TextEditingController?>(
          selector: (context, provider) => provider.budgetValueOneController,
          builder: (context, budgetValueOneController, child) {
            return CustomTextFormField(
              width: 140.h,
              controller: budgetValueOneController,
              hintText: "lbl_budget".tr,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 11.v,
              ),
            );
          },
        ));
  }

  /// Section Widget
  Widget _buildDurationOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.durationOneController,
        builder: (context, durationOneController, child) {
          return CustomTextFormField(
            controller: durationOneController,
            hintText: "lbl_dur_e".tr,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildModifier(BuildContext context) {
    return CustomElevatedButton(
      width: 97.h,
      text: "lbl_modifier".tr,
      buttonStyle: CustomButtonStyles.fillLightGreen,
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer,
    );
  }

  /// Section Widget
  Widget _buildAnnuler(BuildContext context) {
    return CustomElevatedButton(
      width: 97.h,
      text: "lbl_annuler".tr,
      margin: EdgeInsets.only(left: 16.h),
      buttonStyle: CustomButtonStyles.fillBlueGray,
      buttonTextStyle: CustomTextStyles.titleSmallBlack900,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
