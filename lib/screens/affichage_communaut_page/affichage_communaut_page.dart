import 'package:flutter/material.dart';
import 'package:rifund/screens/acceuil_client_page/acceuil_client_page.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'provider/affichage_communaut_provider.dart';

class AffichageCommunautPage extends StatefulWidget {
  const AffichageCommunautPage({Key? key}) : super(key: key);

  @override
  AffichageCommunautPageState createState() => AffichageCommunautPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AffichageCommunautProvider(),
      child: AffichageCommunautPage(),
    );
  }
}

class AffichageCommunautPageState extends State<AffichageCommunautPage> {
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
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 20.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/img_image_33.png',
                  height: 100.v,
                  width: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 36.h),
                  child: Text(
                    "msg_cr_25_03_2024".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.h),
                child: Text(
                  "lbl_a_propos".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 4.v),
              Padding(
                padding: EdgeInsets.only(left: 28.h),
                child: Text(
                  "msg_description_com".tr,
                  style: CustomTextStyles.titleLargeLight,
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 28.h),
                child: Text(
                  "msg_membres_de_la_communaut".tr,
                  style: CustomTextStyles.titleLargeSemiBold,
                ),
              ),
              SizedBox(height: 13.v),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // You may adjust the itemCount as needed
                  itemBuilder: (context, index) {
                    return _buildTaskRow(context, index);
                  },
                ),
              ),
            ],
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
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              onTapArrowleftone(context);
            },
          ),
          AppbarTitle(
            text: "Communauté details".tr,
            margin: EdgeInsets.only(
              left: 50.h,
              top: 2.v,
              right: 40.h,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  Widget _buildTaskRow(BuildContext context, int index) {
    final List<Map<String, dynamic>> members = [
      {
        "name": "Ahmed Chabaa",
        "role": "admin",
        "imagePath": "assets/images/person_image.png"
      },
      {
        "name": "Imen Missaoui",
        "role": "Admin",
        "imagePath": "assets/images/person_image.png"
      },
      {
        "name": "Touafik Keskes",
        "role": "Admin",
        "imagePath": "assets/images/person_image.png"
      },
      {
        "name": "insaf khadhraoui",
        "role": "Membre",
        "imagePath": "assets/images/person_image.png"
      },
      {
        "name": "Fares Abedayem",
        "role": "Membre",
        "imagePath": "assets/images/person_image.png"
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h, vertical: 5.v),
      padding: EdgeInsets.symmetric(vertical: 10.v),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            members[index]["imagePath"],
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10.h),
        Text(
          members[index]["name"],
          style: theme.textTheme.titleSmall,
        ),
        Spacer(),
        Text(
          members[index]["role"],
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(width: 10.h),
        IconButton(
            icon: Icon(Icons.logout, size: 20, color: Colors.grey),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmation '),
                    content:
                        Text('Vous-etes sure pour quitter cette communauté?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Quitter Communauté'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AcceuilClientPage()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text('Annuler'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            })
      ]),
    );
  }

  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
