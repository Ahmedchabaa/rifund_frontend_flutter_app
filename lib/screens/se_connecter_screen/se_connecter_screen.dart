import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/se_connecter_provider.dart';

class SeConnecterScreen extends StatefulWidget {
  const SeConnecterScreen({Key? key}) : super(key: key);

  @override
  SeConnecterScreenState createState() => SeConnecterScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeConnecterProvider(),
      child: SeConnecterScreen(),
    );
  }
}

class SeConnecterScreenState extends State<SeConnecterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 29.v),
                Expanded(
                  child: Container(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Stack(
                        // alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 70.h,
                                vertical: 90.v,
                              ),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder21,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 150.v),
                                  Text(
                                    "msg_vous_n_avez_pas".tr,
                                    style: CustomTextStyles.titleSmallWhiteA700,
                                  ),
                                  SizedBox(height: 5.v),
                                  GestureDetector(
                                    onTap: () {
                                      onTapTxtSinscrire(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 60.v,
                                        right: 90.v,
                                      ),
                                      child: Text(
                                        "lbl_s_inscrire".tr,
                                        style: CustomTextStyles
                                            .titleSmallbBlackA700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 21.h,
                                right: 31.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 17.v),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgFigma2RemovebgPreview,
                                    height: 80.v,
                                    width: 80.h,
                                  ),
                                  SizedBox(height: 30.v),
                                  _buildLoginForm(context)
                                ],
                              ),
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
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 65.v,
      leading: Padding(
        padding: EdgeInsets.only(left: 16, top: 16),
        child: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            onTapImage(context);
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "lbl_bienvenue".tr,
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(height: 31.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.h),
            child: Selector<SeConnecterProvider, TextEditingController?>(
              selector: (context, provider) => provider.usernameoneController,
              builder: (context, usernameoneController, child) {
                return CustomTextFormField(
                  controller: usernameoneController,
                  hintText: "msg_nom_d_utilisateur".tr,
                  suffix: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 12.v, 13.h, 11.v),
                    child: Icon(Icons.person),
                    height: 17,
                    width: 23,
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 14.h,
                    top: 17.v,
                    bottom: 17.v,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.h),
            child: Consumer<SeConnecterProvider>(
              builder: (context, provider, child) {
                return CustomTextFormField(
                  controller: provider.passwordoneController,
                  hintText: "lbl_mot_de_passe".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: InkWell(
                    onTap: () {
                      provider.changePasswordVisibility();
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 13.h, 10.v),
                      child: Icon(Icons.lock),
                      height: 17,
                      width: 23,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                  obscureText: provider.isShowPassword,
                  contentPadding: EdgeInsets.only(
                    left: 14.h,
                    top: 17.v,
                    bottom: 17.v,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12.v),
          CustomElevatedButton(
            alignment: Alignment.center,
            width: 120.h,
            buttonTextStyle: TextStyle(color: Colors.white),
            text: "lbl_se_connecter".tr,
            margin: EdgeInsets.only(
              left: 25.h,
              right: 20.h,
            ),
            onPressed: () {
              onTapSeconnecter(context);
            },
          ),
          SizedBox(height: 9.v),
          GestureDetector(
            onTap: () {
              onTapTxtMotdepasse(context);
            },
            child: Text(
              "msg_mot_de_passe_oubli".tr,
              style: CustomTextStyles.bodyMediumLight,
            ),
          ),
          SizedBox(height: 13.v),
          SizedBox(
            height: 15.v,
            width: 264.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 264.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 25.0), // Adjust the top padding as needed
                      child: Divider(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "lbl_ou".tr,
                    style: CustomTextStyles.labelLargeBlack900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                color: Colors.blue,
                splashColor: Colors.white,
                iconSize: 35,
                onPressed: () {
                  // Handle Facebook login
                },
              ),
              IconButton(
                icon: Icon(Icons.email),
                color: Colors.red,
                iconSize: 35,
                splashColor: Colors.white,
                onPressed: () {
                  // Handle email login
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void onTapTxtSinscrire(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.crErUnCompteScreen);
  }

  void onTapImage(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.welcomeScreen);
  }

  void onTapSeconnecter(BuildContext context) {
    // Handle login action
  }

  void onTapTxtMotdepasse(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.motDePasseOublierScreen);
  }
}
