import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rifund/screens/affichage_par_categorie/provider/affichagecategorie_provider.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_search_view.dart';
import '../details_projet_screen/details_projet_screen.dart';
import '../financer_projet_screen/financer_projet_screen.dart';

class AffichageCategoriePage extends StatefulWidget {
  const AffichageCategoriePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AffichageCategorieProvider(),
      child: AffichageCategoriePage(),
    );
  }

  @override
  AffichageCategoriePageState createState() => AffichageCategoriePageState();
}

class AffichageCategoriePageState extends State<AffichageCategoriePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMaleUserOneRow(context),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 26.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 48.v),
                    _buildRowListedeOneSection(context),
                    SizedBox(height: 17.v),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(5, (_) => _buildProjetNrgColumn(context)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }


  Widget _buildMaleUserOneRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 27.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.fillLightGreen.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(width: 11.h),
                  Container(
                    width: 111.h,
                    margin: EdgeInsets.only(
                      left: 11.h,
                      top: 12.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "msg_nom_d_utilisateur2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeWhiteA700,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(right: 11.h),
              child:
                  Selector<AffichageCategorieProvider, TextEditingController?>(
                selector: (context, provider) => provider.searchController,
                builder: (context, searchController, child) {
                  return CustomSearchView(
                    hintText: "Rechercher",
                    suffix: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
                      height: 17,
                      width: 23,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowListedeOneSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            "Liste des projets".tr,
            style: theme.textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }

  Widget _buildProjetNrgColumn(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.v),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appTheme.lightGreen600,
              width: 5.h,
            ),
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Container(
            height: 240.v,
            width: 340.h,
            decoration: AppDecoration.outlineLightgreen6002.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Stack(
              children: [
                _buildProjetAgricoleStack(
                  context,
                  imageFour: ImageConstant.imgRectangle117,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 32.h,
                      right: 20.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.h,
                      vertical: 8.v,
                    ),
                    decoration: AppDecoration.outlineBlack9002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 27.h),
                          child: Text(
                            "lbl_projet_n_rgie".tr,
                            style: CustomTextStyles.titleLargeBold,
                          ),
                        ),
                        SizedBox(height: 11.v),
                        Padding(
                          padding: EdgeInsets.only(left: 27.h),
                          child: Text(
                            "msg_grand_projet_n_rg_tique".tr,
                            style: CustomTextStyles.bodyMediumLight_1,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Padding(
                          padding: EdgeInsets.only(left: 27.h),
                          child: Text(
                            "lbl_80_000".tr,
                            style: CustomTextStyles.titleLargeLightgreen600,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Container(
                          height: 14.v,
                          width: 177.h,
                          margin: EdgeInsets.only(left: 27.h),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 14.v,
                                  width: 176.h,
                                  decoration: BoxDecoration(
                                    color:
                                        theme.colorScheme.onSecondaryContainer,
                                    borderRadius: BorderRadius.circular(7.h),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7.h),
                                    child: LinearProgressIndicator(
                                      value: 0.8,
                                      backgroundColor: theme
                                          .colorScheme.onSecondaryContainer,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        appTheme.lightGreen600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "lbl_70".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomElevatedButton(
                                height: 45.v,
                                width: 130.h,
                                text: "lbl_faire_un_don".tr,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FinancerProjetScreen()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              CustomElevatedButton(
                                height: 45.v,
                                width: 75.h,
                                text: "lbl_plus".tr,
                                buttonStyle: CustomButtonStyles.fillGray,
                                buttonTextStyle: theme.textTheme.titleMedium!,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsProjetScreen()),
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

   Widget _buildProjetAgricoleStack(
    BuildContext context, {
    required String imageFour,
  }) {
    return SizedBox(
      height: 258.v,
      width: 193.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle117,
            height: 258.v,
            width: 193.h,
            radius: BorderRadius.horizontal(
              left: Radius.circular(15.h),
            ),
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: imageFour,
            height: 258.v,
            width: 193.h,
            radius: BorderRadius.horizontal(
              left: Radius.circular(20.h),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }

}
