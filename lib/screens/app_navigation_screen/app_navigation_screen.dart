import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/app_navigation_model.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
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
          width: 375.h,
          child: Column(
            children: [
              Container(
                decoration: AppDecoration.fillWhiteA,
                child: Column(
                  children: [
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          "lbl_app_navigation".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "msg_check_your_app_s".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appTheme.blueGray400,
                            fontSize: 16.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Divider(
                      height: 1.v,
                      thickness: 1.v,
                      color: appTheme.black900,
                    )
                  ],
                ),
              ),
              _buildGroupAP12(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroupAP12(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: AppDecoration.fillWhiteA,
          child: Container(
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                SizedBox(height: 10.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Text(
                      "lbl_financer_projet2".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: appTheme.black900,
                        fontSize: 20.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                SizedBox(height: 5.v),
                Divider(
                  height: 1.v,
                  thickness: 1.v,
                  color: appTheme.blueGray400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
