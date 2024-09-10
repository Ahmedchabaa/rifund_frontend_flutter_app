import 'package:flutter/material.dart';
import 'package:rifund/screens/acceuil_client_page/acceuil_client_page.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/financer_projet_model.dart';
import 'provider/financer_projet_provider.dart';

const List<String> list = <String>['DT', '£', '€', 'Four'];

class FinancerProjetScreen extends StatefulWidget {
  const FinancerProjetScreen({Key? key}) : super(key: key);

  @override
  FinancerProjetScreenState createState() => FinancerProjetScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FinancerProjetProvider(),
      child: FinancerProjetScreen(),
    );
  }
}

class FinancerProjetScreenState extends State<FinancerProjetScreen> {
  final _formKey = GlobalKey<FormState>(); // Added GlobalKey for form validation
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
        appBar: _buildAppBar(context),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView( // Added SingleChildScrollView for scrolling
          child: Form(
            key: _formKey, // Wrapped with Form widget
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 54.v),
                Text("Financer Projet".tr,
                    style: TextStyle(
                      color: Colors.lightGreen.shade600,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    )),
                SizedBox(height: 30.v),
                _buildColumnfullname(context),
                SizedBox(height: 20.v), // Added margin to ensure space
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
            text: "Financer Projet".tr,
            margin: EdgeInsets.only(
              left: 80.h,
              top: 2.v,
              right: 79.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  Widget _buildFullNameOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<FinancerProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.fullNameOneController,
        builder: (context, fullNameOneController, child) {
          return CustomTextFormField(
            controller: fullNameOneController,
            hintText: "Nom et prénom".tr,
            suffix: Container(
              padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
              child: Icon(
                Icons.person,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre nom et prénom';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildNumberOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<FinancerProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.numberOneController,
        builder: (context, numberOneController, child) {
          return CustomTextFormField(
            controller: numberOneController,
            hintText: "Numéro".tr,
            suffix: Container(
              padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
              child: Icon(
                Icons.credit_card,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un numéro';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildCodescret(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<FinancerProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.codescretController,
        builder: (context, codescretController, child) {
          return CustomTextFormField(
            controller: codescretController,
            hintText: "Code secret".tr,
            suffix: Container(
              padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
              child: Icon(
                Icons.lock,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un code secret';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildDateexp(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Selector<FinancerProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.dateexpController,
        builder: (context, dateexpController, child) {
          return CustomTextFormField(
            controller: dateexpController,
            hintText: "Date d'expiration".tr,
            suffix: Container(
              padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
              child: Icon(
                Icons.calendar_month,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer une date d\'expiration';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildBudgetValueOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        child: Selector<FinancerProjetProvider, TextEditingController?>(
          selector: (context, provider) => provider.budgetValueOneController,
          builder: (context, budgetValueOneController, child) {
            return CustomTextFormField(
              width: 120.h,
              controller: budgetValueOneController,
              hintText: "lbl_budget".tr,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un budget';
                }
                return null;
              },
            );
          },
        ));
  }

  Widget _buildSauvgarder(BuildContext context) {
    return CustomElevatedButton(
      height: 45.v,
      width: 109.h,
      text: "lbl_sauvgarder".tr,
      buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AcceuilClientPage()),
          );
        }
      },
    );
  }

  Widget _buildAnnuler(BuildContext context) {
    return CustomElevatedButton(
      height: 45.v,
      width: 117.h,
      text: "lbl_annuler".tr,
      margin: EdgeInsets.only(left: 12.h),
      buttonStyle: CustomButtonStyles.fillGrayTL18,
      buttonTextStyle: theme.textTheme.labelLarge!,
      onPressed: () {
        onTapArrowleftone(context);
      },
    );
  }

  Widget _buildColumnfullname(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 39.v,
      ),
      decoration: AppDecoration.outlineLightgreen600.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.v),
          _buildFullNameOne(context),
          SizedBox(height: 9.v),
          _buildNumberOne(context),
          SizedBox(height: 9.v),
          _buildCodescret(context),
          SizedBox(height: 9.v),
          _buildDateexp(context),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBudgetValueOne(context),
                Selector<FinancerProjetProvider, FinancerProjetModel?>(
                  selector: (context, provider) =>
                      provider.financerProjetModelObj,
                  builder: (context, financerProjetModelObj, child) {
                    return CustomDropDown(
                      width: 120.h,
                      icon: CustomImageView(
                        imagePath: ImageConstant.imgcrprojet,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                      ),
                      hintText: "Devise".tr,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 15.v,
                      ),
                      items: financerProjetModelObj?.dropdownItemList ?? [],
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSauvgarder(context),
                _buildAnnuler(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
