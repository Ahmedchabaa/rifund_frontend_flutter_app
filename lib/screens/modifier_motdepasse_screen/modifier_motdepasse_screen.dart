import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rifund/screens/profile_screen/profile_screen.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/modifier_motdepasse_provider.dart';

class ModifierMotdepasseScreen extends StatefulWidget {
  const ModifierMotdepasseScreen({Key? key}) : super(key: key);

  @override
  ModifierMotdepasseScreenState createState() => ModifierMotdepasseScreenState();
  
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifierMotdepasseProvider(),
      child: ModifierMotdepasseScreen(),
    );
  }
}

class ModifierMotdepasseScreenState extends State<ModifierMotdepasseScreen> {
  final _formKey = GlobalKey<FormState>(); // Added GlobalKey for form validation

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
        body: SingleChildScrollView(
          child: Form( // Wrapped Column with Form
            key: _formKey, // Added GlobalKey for form validation
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 59.v),
                Container(
                  width: 308.h,
                  margin: EdgeInsets.only(left: 30.h, right: 20.h),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildModifier(context),
                          SizedBox(width: 10.h), // Adjust spacing between buttons
                          _buildAnnuler(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
            text: "msg_changer_mot_de_passe".tr,
            margin: EdgeInsets.only(left: 50.h, top: 2.v, right: 75.h),
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
            controller: enterPasswordController,
            hintText: "msg_saisir_votre_mot".tr,
            hintStyle: theme.textTheme.bodyMedium!,
            obscureText: true, // Hide password input
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre mot de passe actuel';
              }
              return null;
            },
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
            obscureText: true, // Hide password input
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nouveau mot de passe';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
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
            obscureText: true, // Hide password input
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez répéter le nouveau mot de passe';
              }
              if (value != context.read<ModifierMotdepasseProvider>().enterPassword1Controller.text) {
                return 'Les mots de passe ne correspondent pas';
              }
              return null;
            },
            textInputAction: TextInputAction.done,
          );
        },
      ),
    );
  }

  Widget _buildModifier(BuildContext context) {
    return CustomElevatedButton(
      height: 36.v,
      width: 117.h,
      text: "lbl_modifier".tr,
      margin: EdgeInsets.only(top: 1.v),
      buttonTextStyle: CustomTextStyles.titleSmallPrimary.copyWith(color: Colors.white),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
      },
    );
  }

  Widget _buildAnnuler(BuildContext context) {
    return CustomElevatedButton(
      height: 36.v,
      width: 117.h,
      text: "lbl_annuler".tr,
      margin: EdgeInsets.only(top: 1.v),
      buttonStyle: CustomButtonStyles.fillBlueGray,
      buttonTextStyle: theme.textTheme.titleSmall!,
      onPressed: () {
        onTapArrowleftone(context);
      },
    );
  }

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
