import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/mot_de_passe_oublier_provider.dart';

class MotDePasseOublierScreen extends StatefulWidget {
  const MotDePasseOublierScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MotDePasseOublierScreenState createState() => MotDePasseOublierScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MotDePasseOublierProvider(),
      child: MotDePasseOublierScreen(),
    );
  }
}

class MotDePasseOublierScreenState extends State<MotDePasseOublierScreen> {
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
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.v,
          ),
          child: Column(
            children: [
             Align(
               alignment: Alignment.center,
                child: Text(
                  "msg_mot_de_passe_oubli2".tr,
                  style: CustomTextStyles.titleLargeExtraBold,
                ),
              ),
              SizedBox(height: 20.v),
          Container(
           margin: EdgeInsets.only(
             left: 17,
          right: 40,
            ),
          child: Text(
           "Entrez votre email pour recevoir un mot de passe de réinitialisation par email.",
              overflow: TextOverflow.visible,
          style: CustomTextStyles.bodyMediumLight,
  ),
),

              SizedBox(height: 28.v),
              _buildLoginForm(context),
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
      // styleType: Style.bgFill_1,
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 5.h),
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.outlineLightGreen.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 47.v),
          Container(
            child: Selector<MotDePasseOublierProvider, TextEditingController?>(
              selector: (context, provider) => provider.emailController,
              builder: (context, emailController, child) {
                return CustomTextFormField(
                  controller: emailController,
                  hintText: "lbl_email".tr,
                  suffix: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
                    child: Icon(
                      Icons.mail,
                    ),
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
          SizedBox(height: 20.v),
          CustomElevatedButton(
            width: 100.h,
             height: 40.v,
            text: "lbl_envoyer".tr,
            buttonTextStyle: theme.textTheme.labelLarge!,
          ),
          SizedBox(height: 50.v),
          Text(
            "msg_vous_avez_d_j_un".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 7.v),
          GestureDetector(
            onTap: () {
              onTapTxtSeconnecter(context);
            },
            child: Text(
              "lbl_se_connecter".tr,
              style: CustomTextStyles.titleSmallLightgreen600,
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the seConnecterScreen when the action is triggered.
  onTapImage(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the seConnecterScreen when the action is triggered.
  onTapTxtSeconnecter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.seConnecterScreen,
    );
  }
}
