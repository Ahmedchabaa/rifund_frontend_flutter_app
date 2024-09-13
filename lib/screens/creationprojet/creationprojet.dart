import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rifund/screens/listeprojets/listeprojets.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/modelcrprojet.dart';
import 'provider/cr_er_projet_provider.dart';

class CrErProjetScreen extends StatefulWidget {
  const CrErProjetScreen({Key? key}) : super(key: key);

  @override
  CrErProjetScreenState createState() => CrErProjetScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CrErProjetProvider(),
      child: CrErProjetScreen(),
    );
  }
}

class CrErProjetScreenState extends State<CrErProjetScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 27.h,
                vertical: 16.v,
              ),
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "msg_creation_du_projet".tr,
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.v),
                  Text(
                    "msg_cr_er_votre_projet".tr,
                    style: CustomTextStyles.titleLargeInterSemiBold,
                  ),
                  SizedBox(height: 18.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 11.h),
                      child: Text(
                        "msg_remplir_la_formulaire".tr,
                        style: CustomTextStyles.bodyMediumBlack900,
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
                  _buildDeviseValue(context),
                  SizedBox(height: 18.v),
                  _buildDate(context),
                  SizedBox(height: 18.v),
                  Padding(
                    padding: EdgeInsets.only(right: 2.h),
                    child: Selector<CrErProjetProvider, CrErProjetModel?>(
                      selector: (context, provider) =>
                          provider.crErProjetModelObj,
                      builder: (context, crErProjetModelObj, child) {
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
                          items: crErProjetModelObj?.dropdownItemList1 ?? [],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 18.v),
                  _buildCompte(context),
                  SizedBox(height: 18.v),
                  _buildCreateButton(context),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
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
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              onTapArrowleftone(context);
            },
          ),
          AppbarTitle(
            text: "Créer projet".tr,
            margin: EdgeInsets.only(
              left: 85.h,
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
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Selector<CrErProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.projectTitleController,
        builder: (context, projectTitleController, child) {
          return CustomTextFormField(
            controller: projectTitleController,
            hintText: "lbl_titre_du_projet".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
            validator: validateProjectTitle,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildDescriptionValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Selector<CrErProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.descriptionValueController,
        builder: (context, descriptionValueController, child) {
          return CustomTextFormField(
            controller: descriptionValueController,
            hintText: "lbl_description".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
            validator: validateDescription,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildProjectImages(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Selector<CrErProjetProvider, TextEditingController?>(
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
                validator: (value) {
                  // Custom validation if needed
                  return null;
                },
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
                      List<String> fileNames =
                          result.files.map((file) => file.name ?? '').toList();
                      print('Selected images: $paths');
                      print('Selected image names: $fileNames');
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.v, horizontal: 10.h),
                    child: Icon(Icons.add_photo_alternate),
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
  Widget _buildBudgetValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Selector<CrErProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.budgetValueController,
        builder: (context, budgetValueController, child) {
          return CustomTextFormField(
            width: 143.h,
            controller: budgetValueController,
            hintText: "lbl_budget".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
            validator: validateBudget,
          );
        },
      ),
    );
  }

  Widget _buildDeviseValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBudgetValue (context),
          Selector<CrErProjetProvider, CrErProjetModel?>(
            selector: (context, provider) => provider.crErProjetModelObj,
            builder: (context, crErProjetModelObj, child) {
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
                items: crErProjetModelObj?.dropdownItemList1 ?? [],
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Selector<CrErProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.dateController,
        builder: (context, dateController, child) {
          return CustomTextFormField(
            controller: dateController,
            hintText: "lbl_date".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
            validator: validateDate,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCompte(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Selector<CrErProjetProvider, TextEditingController?>(
        selector: (context, provider) => provider.compteController,
        builder: (context, compteController, child) {
          return CustomTextFormField(
            controller: compteController,
            hintText: "Numero de compte".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 11.v,
            ),
            validator: validateAccountNumber,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateButton(BuildContext context) {
    return CustomElevatedButton(
      height: 36.v,
      width: 114.h,
      text: "lbl_cr_er".tr,
      buttonTextStyle: CustomTextStyles.titleLargeInterOnPrimaryContainer,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // Process the form data if validation is successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListeDesProjetsPage()),
          );
        }
      },
    );
  }

  void onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }

  // Validators
  String? validateProjectTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le titre du projet est requis';
    }
    if (value.length < 3) {
      return 'Le titre du projet doit contenir au moins 3 caractères';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'La description est requise';
    }
    return null;
  }

  String? validateBudget(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le budget est requis';
    }
    if (double.tryParse(value) == null) {
      return 'Veuillez entrer un montant valide';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La date est requise';
    }
    // Optionally, add a custom date format check here if needed
    return null;
  }

  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro de compte est requis';
    }
    return null;
  }
}
