import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rifund/screens/affichage_par_categorie/affichagecategorie.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_search_view.dart';
import '../details_projet_screen/details_projet_screen.dart';
import '../financer_projet_screen/financer_projet_screen.dart';
import 'models/listtext_item_model.dart';
import 'provider/acceuil_client_provider.dart';
import 'widgets/listtext_item_widget.dart';

class AcceuilClientPage extends StatefulWidget {
  const AcceuilClientPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AcceuilClientProvider(),
      child: AcceuilClientPage(),
    );
  }

  @override
  AcceuilClientPageState createState() => AcceuilClientPageState();
}

class AcceuilClientPageState extends State<AcceuilClientPage> {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMaleUserOneRow(context),
            SizedBox(height: 47.v),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Text(
                "lbl_cat_gories".tr,
                textAlign: TextAlign.left,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            _buildCategoriesColumn(context),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Text(
                "msg_projets_financ_s".tr,
                textAlign: TextAlign.left,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: _buildProjetNrgColumn(context),
            ),
            SizedBox(height: 5.v),
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
              child: Selector<AcceuilClientProvider, TextEditingController?>(
                selector: (context, provider) => provider.searchController,
                builder: (context, searchController, child) {
                  return CustomSearchView(
                      hintText: "Rechercher",
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 7.v, 10.h, 7.v),
                        height: 17,
                        width: 23,
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesColumn(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 21.v),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 115.v,
              child: Consumer<AcceuilClientProvider>(
                builder: (context, provider, child) {
                  return ListView.separated(
                    padding: EdgeInsets.only(left: 24.h),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20.h,
                      );
                    },
                    itemCount:
                        provider.acceuilClientModelObj.listtextItemList.length,
                    itemBuilder: (context, index) {
                      ListtextItemModel model = provider
                          .acceuilClientModelObj.listtextItemList[index];
                      return SizedBox(
                        width: 170,
                        height: 130,
                        child: ListtextItemWidget(
                          model,
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AffichageCategoriePage(),
                              ),
                            );
                          },
                        
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProjetNrgColumn(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Ensure horizontal scrolling
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                                      color: theme
                                          .colorScheme.onSecondaryContainer,
                                      borderRadius: BorderRadius.circular(
                                        7.h,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        7.h,
                                      ),
                                      child: LinearProgressIndicator(
                                        value: 0.8,
                                        backgroundColor: theme
                                            .colorScheme.onSecondaryContainer,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
          SizedBox(width: 15.h), // Add some spacing between items
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
                                      color: theme
                                          .colorScheme.onSecondaryContainer,
                                      borderRadius: BorderRadius.circular(
                                        7.h,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        7.h,
                                      ),
                                      child: LinearProgressIndicator(
                                        value: 0.8,
                                        backgroundColor: theme
                                            .colorScheme.onSecondaryContainer,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
          SizedBox(width: 15.h),
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
                                      color: theme
                                          .colorScheme.onSecondaryContainer,
                                      borderRadius: BorderRadius.circular(
                                        7.h,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        7.h,
                                      ),
                                      child: LinearProgressIndicator(
                                        value: 0.8,
                                        backgroundColor: theme
                                            .colorScheme.onSecondaryContainer,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
          SizedBox(width: 15.h), // Add some spacing between items
        ],
      ),
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

  Widget _buildRowfaireUnDon(
    BuildContext context, {
    required String donationText,
    required String plusText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillLightGreen.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Text(
            donationText,
            style: CustomTextStyles.titleMediumWhiteA700.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        ),
        SizedBox(height: 31.h),
        Container(
          width: 80.h,
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 13.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Text(
            plusText,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        )
      ],
    );
  }
}
