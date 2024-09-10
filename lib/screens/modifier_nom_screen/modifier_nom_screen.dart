import 'package:flutter/material.dart';
import 'package:rifund/screens/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/modifier_nom_provider.dart';

class ModifierNomScreen extends StatefulWidget {
  const ModifierNomScreen({Key? key}) : super(key: key);

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
  final _formKey = GlobalKey<FormState>(); // Key for form validation

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: true,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 52.v),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: _buildSignupForm(context),
                ),
              ),
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
              NavigatorService.goBack();
            },
          ),
          AppbarTitle(
            text: "Changer nom d'utilisateur".tr,
            margin: EdgeInsets.only(left: 40.h, top: 2.v, right: 55.h),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  Widget _buildSignupForm(BuildContext context) {
    return Form(
      key: _formKey, // Attach form key here
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 30.v),
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
              padding: EdgeInsets.symmetric(horizontal: 9.h),
              child: Selector<ModifierNomProvider, TextEditingController?>(
                selector: (context, provider) => provider.enternewusernamController,
                builder: (context, enternewusernamController, child) {
                  return CustomTextFormField(
                    controller: enternewusernamController,
                    hintText: "msg_saisir_nouveau_nom".tr,
                    hintStyle: theme.textTheme.bodyMedium!,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un nom d\'utilisateur'; // Error message for empty input
                      }
                      if (value.length < 3) {
                        return 'Le nom d\'utilisateur doit comporter au moins 3 caractères'; // Error message for short input
                      }
                      return null;
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 41.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
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
                ),
                SizedBox(width: 10.h),
                CustomElevatedButton(
                  height: 36.v,
                  width: 117.h,
                  text: "lbl_annuler".tr,
                  margin: EdgeInsets.only(top: 1.v),
                  buttonStyle: CustomButtonStyles.fillBlueGray,
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    NavigatorService.goBack();
                  },
                ),
              ],
            ),
            SizedBox(height: 24.v),
          ],
        ),
      ),
    );
  }
}
