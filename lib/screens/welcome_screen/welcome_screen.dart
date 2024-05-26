import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/welcome_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeProvider(),
      child: WelcomeScreen(),
    );
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 29.v),
              Expanded(
                child: Container(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage3,
                          height: 242.v,
                          width: 321.h,
                        ),
                        SizedBox(height: 30.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.h,
                            vertical: 86.5.v,
                          ),
                          decoration: AppDecoration.fillLightGreen.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder21,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 300.h,
                                margin: EdgeInsets.only(right: 12.h),
                                child: Text(
                                  "msg_gr_ce_votre_contribution".tr,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .titleLargeWhiteA700Black
                                      .copyWith(
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(height: 28.v),
                              CustomElevatedButton(
                                height: 50.v,
                                text: "lbl_se_connecter".tr,
                                margin: EdgeInsets.only(
                                  left: 35.h,
                                  right: 20.h,
                                ),
                                onPressed: () {
                                  onTapSeconnecter(context);
                                },
                                buttonStyle: CustomButtonStyles.fillWhiteA,
                                buttonTextStyle:
                                    CustomTextStyles.titleLargeSemiBold,
                              ),
                              SizedBox(height: 15.v),
                              CustomElevatedButton(
                                height: 50.v,
                                text: "lbl_faire_un_don".tr,
                                margin: EdgeInsets.only(
                                  left: 35.h,
                                  right: 20.h,
                                ),
                                onPressed: () {
                                  onTapFaireundon(context);
                                },
                                buttonStyle: CustomButtonStyles.fillWhiteA,
                                buttonTextStyle:
                                    CustomTextStyles.titleLargeSemiBold,
                              ),
                              // SizedBox(height: 2.h)
                            ],
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
    );
  }

  onTapFaireundon(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.acceuilClientPage);
  }

  void onTapSeconnecter(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.seConnecterScreen);
  }
}
