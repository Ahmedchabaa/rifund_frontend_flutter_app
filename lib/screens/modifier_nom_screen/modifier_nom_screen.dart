import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/modifier_nom_provider.dart';

class ModifierNomScreen extends StatefulWidget {
  const ModifierNomScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ModifierNomScreenState createState() => ModifierNomScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifierNomProvider(),
      child: ModifierNomScreen(),
    );
  }
}

class ModifierNomScreenState extends State<ModifierNomScreen> {
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
        appBar: _buildAppBar(context), // Ajout de l'app bar ici
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 21.h,
            vertical: 52.v,
          ),
          child: Column(
            children: [
              // L'en-tête est maintenant inclus dans l'app bar
              Spacer(
                flex: 56,
              ),
              _buildSignupForm(context),
              Spacer(
                flex: 44,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: theme.colorScheme.primary,
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: Icon(
  //         Icons.arrow_back_ios_outlined,
  //         color: Colors.lightGreen.shade600,
  //       ),
  //       onPressed: () {
  //         onTapImgArrowleftone(context);
  //       },
  //     ),
  //     title: Text(
  //       "msg_changer_nom_d_utilisateur".tr,
  //       style: CustomTextStyles.titleLargeLightgreen60001,
  //     ),
  //     centerTitle: true,
  //     automaticallyImplyLeading:
  //         false, // Désactive le bouton de retour automatique
  //   );
  // }

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
            text: "msg_changer_nom_d_utilisateur".tr,
            margin: EdgeInsets.only(
              left: 40.h,
              top: 2.v,
              right: 55.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  Widget _buildSignupForm(BuildContext context) {
    return Container(
      width: 308.h,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 3.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 58.v,
      ),
      decoration: AppDecoration.outlineLightgreen600011.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "msg_changer_nom_d_utilisateur".tr,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 36.v),
          Padding(
            padding: EdgeInsets.only(
              left: 9.h,
              right: 7.h,
            ),
            child: Selector<ModifierNomProvider, TextEditingController?>(
              selector: (context, provider) =>
                  provider.enternewusernamController,
              builder: (context, enternewusernamController, child) {
                return CustomTextFormField(
                  controller: enternewusernamController,
                  hintText: "msg_saisir_nouveau_nom".tr,
                  hintStyle: theme.textTheme.bodyMedium!,
                  textInputAction: TextInputAction.done,
                );
              },
            ),
          ),
          SizedBox(height: 41.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  width: 97.h,
                  text: "lbl_modifier".tr,
                  margin: EdgeInsets.only(top: 1.v),
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary
                      .copyWith(color: Colors.white),
                ),
                CustomElevatedButton(
                  width: 97.h,
                  text: "lbl_annuler".tr,
                  margin: EdgeInsets.only(left: 10.h),
                  buttonStyle: CustomButtonStyles.fillBlueGray,
                  buttonTextStyle: theme.textTheme.titleSmall!,
                )
              ],
            ),
          ),
          SizedBox(height: 24.v)
        ],
      ),
    );
  }

  onTapImgArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
