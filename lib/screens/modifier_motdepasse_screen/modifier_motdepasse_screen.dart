import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/modifier_motdepasse_provider.dart';

class ModifierMotdepasseScreen extends StatefulWidget {
  const ModifierMotdepasseScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ModifierMotdepasseScreenState createState() =>
      ModifierMotdepasseScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifierMotdepasseProvider(),
      child: ModifierMotdepasseScreen(),
    );
  }
}

class ModifierMotdepasseScreenState extends State<ModifierMotdepasseScreen> {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 59.v),
                Container(
                  width: 308.h,
                  margin: EdgeInsets.only(
                    left: 30.h,
                    right: 20.h,
                  ),
                  padding: EdgeInsets.all(26.h),
                  decoration: AppDecoration.outlinePrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "msg_changer_mot_de_passe".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 6.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 241.h,
                          margin: EdgeInsets.only(right: 13.h),
                          child: Text(
                            "msg_votre_mot_de_passe".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleSmallMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 52.v),
                      _buildEnterPassword(context),
                      SizedBox(height: 21.v),
                      _buildEnterPassword1(context),
                      SizedBox(height: 20.v),
                      _buildRepetezLe(context),
                      SizedBox(height: 46.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildModifier(context),
                            _buildAnnuler(context)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Spacer()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBar()),
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
            text: "msg_changer_mot_de_passe".tr,
            margin: EdgeInsets.only(
              left: 50.h,
              top: 2.v,
              right: 75.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  Widget _buildEnterPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierMotdepasseProvider, TextEditingController?>(
        selector: (context, provider) => provider.enterPasswordController,
        builder: (context, enterPasswordController, child) {
          return CustomTextFormField(
            // onChanged: (value) {
            //   // Traitement du changement de texte ici
            // },
            controller: enterPasswordController,
            hintText: "msg_saisir_votre_mot".tr,
            hintStyle: theme.textTheme.bodyMedium!,
          );
        },
      ),
    );
  }

  Widget _buildEnterPassword1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierMotdepasseProvider, TextEditingController?>(
        selector: (context, provider) => provider.enterPassword1Controller,
        builder: (context, enterPassword1Controller, child) {
          return CustomTextFormField(
            controller: enterPassword1Controller,
            hintText: "msg_saisir_nouveau_mot".tr,
            hintStyle: theme.textTheme.bodyMedium!,
            textInputAction: TextInputAction.done,
          );
        },
      ),
    );
  }

  Widget _buildRepetezLe(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<ModifierMotdepasseProvider, TextEditingController?>(
        selector: (context, provider) => provider.RepetezLeController,
        builder: (context, RepetezLeController, child) {
          return CustomTextFormField(
            controller: RepetezLeController,
            hintText: "Repetez nouveau mot de passe".tr,
            hintStyle: theme.textTheme.bodyMedium!,
            textInputAction: TextInputAction.done,
          );
        },
      ),
    );
  }

  Widget _buildModifier(BuildContext context) {
    return CustomElevatedButton(
      width: 97.h,
      text: "lbl_modifier".tr,
      margin: EdgeInsets.only(top: 1.v),
      buttonTextStyle:
          CustomTextStyles.titleSmallPrimary.copyWith(color: Colors.white),
    );
  }

  Widget _buildAnnuler(BuildContext context) {
    return CustomElevatedButton(
      width: 97.h,
      text: "lbl_annuler".tr,
      margin: EdgeInsets.only(left: 10.h),
      buttonStyle: CustomButtonStyles.fillBlueGray,
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
