import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure provider is imported

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/cr_er_un_compte_provider.dart';

class CrErUnCompteScreen extends StatefulWidget {
  const CrErUnCompteScreen({Key? key}) : super(key: key);

  @override
  CrErUnCompteScreenState createState() => CrErUnCompteScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CrErUnCompteProvider(),
      child: CrErUnCompteScreen(),
    );
  }
}

class CrErUnCompteScreenState extends State<CrErUnCompteScreen> {
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
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 3.v),
                Expanded(
                  child: Container(
                    child: RepaintBoundary(
                      child: SizedBox(
                        height: 770.v,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 100.h,
                                  vertical: 90.v,
                                ),
                                decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder21,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 110.v),
                                    SizedBox(height: 5.v),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 55.v, right: 85.v),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
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
                                      imagePath: ImageConstant.imgFigma2RemovebgPreview,
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
      centerTitle: true,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              onTapImage(context);
            },
          ),
          AppbarTitle(
            text: "",
            margin: EdgeInsets.only(
              left: 50.h,
              top: 2.v,
              right: 60.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      width: 300.h,
      margin: EdgeInsets.only(left: 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "lbl_cr_er_un_compte".tr,
            style: CustomTextStyles.titleLargeExtraBold,
          ),
          SizedBox(height: 34.v),
          _buildImageOne(context),
          SizedBox(height: 27.v),
          _buildEmail(context),
          SizedBox(height: 26.v),
          _buildPasswordOne(context),
          SizedBox(height: 27.v),
          _buildConfirmPassword(context),
          SizedBox(height: 22.v),
          _buildCreateButton(context),
        ],
      ),
    );
  }
 Widget _buildImageOne(BuildContext context) {
  return Selector<CrErUnCompteProvider, TextEditingController?>(
    selector: (context, provider) => provider.imageOneController,
    builder: (context, imageOneController, child) {
      return CustomTextFormField(
        controller: imageOneController,
        hintText: "lbl_nom".tr,
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
          child: Icon(Icons.person),
          height: 17,
          width: 23,
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 41.v,
        ),
        // Add validation logic
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ce champ ne peut pas être vide".tr; // Custom error message for empty input
          }
          return null; // Return null if the input is valid
        },
      );
    },
  );
}

  Widget _buildEmail(BuildContext context) {
    return Selector<CrErUnCompteProvider, TextEditingController?>(
      selector: (context, provider) => provider.emailController,
      builder: (context, emailController, child) {
        return CustomTextFormField(
          controller: emailController,
          hintText: "lbl_email".tr,
          textInputType: TextInputType.emailAddress,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
            child: Icon(Icons.mail),
            height: 17,
            width: 23,
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 41.v,
          ),
          validator: (value) {
            if (value == null || !isValidEmail(value, isRequired: true)) {
              return "E-mail invalide".tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildPasswordOne(BuildContext context) {
    return Consumer<CrErUnCompteProvider>(
      builder: (context, provider, child) {
        return CustomTextFormField(
          controller: provider.passwordOneController,
          hintText: "lbl_mot_de_passe2".tr,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              provider.changePasswordVisibility();
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
              child: Icon(Icons.lock),
              height: 17,
              width: 23,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 41.v,
          ),
          validator: (value) {
            if (value == null || !isValidPassword(value, isRequired: true)) {
              return "mot de passe est vide".tr;
            }
            return null;
          },
          obscureText: provider.isShowPassword,
        );
      },
    );
  }

  Widget _buildConfirmPassword(BuildContext context) {
    return Consumer<CrErUnCompteProvider>(
      builder: (context, provider, child) {
        return CustomTextFormField(
          controller: provider.confirmPasswordController,
          hintText: "msg_confirmer_le_mot".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              provider.changePasswordVisibility1();
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
              child: Icon(Icons.lock),
              height: 17,
              width: 23,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 41.v,
          ),
          validator: (value) {
            if (value == null || !isValidPassword(value, isRequired: true)) {
              return "Mot de passe est vide".tr;
            }
            return null;
          },
          obscureText: provider.isShowPassword1,
        );
      },
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return Center(
      child: CustomElevatedButton(
        width: 120.h,
        height: 40.v,
        text: "lbl_cr_er".tr,
        margin: EdgeInsets.only(
          left: 25.h,
          right: 20.h,
        ),
        buttonTextStyle: CustomTextStyles.labelLarge_1,
        onPressed: () {
           if (_formKey.currentState!.validate()) {
            // Handle form submission
      
          onTapCreateButton(context);
            }},
        alignment: Alignment.center,
      ),
    );
  }

  void onTapImage(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.seConnecterScreen);
  }

  void onTapCreateButton(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.seConnecterScreen);
  }
}
