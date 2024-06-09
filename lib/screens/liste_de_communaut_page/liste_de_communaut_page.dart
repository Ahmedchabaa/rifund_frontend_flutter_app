import 'package:flutter/material.dart';
import 'package:rifund/screens/cr_er_communaut_screen/cr_er_communaut_screen.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/communitycardsection_item_model.dart';
import 'provider/liste_de_communaut_provider.dart';
import 'widgets/communitycardsection_item_widget.dart'; // ignore_for_file: must_be_immutable

class ListeDeCommunautPage extends StatefulWidget {
  const ListeDeCommunautPage({Key? key})
      : super(
          key: key,
        );

  @override
  ListeDeCommunautPageState createState() => ListeDeCommunautPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListeDeCommunautProvider(),
      child: ListeDeCommunautPage(),
    );
  }
}

class ListeDeCommunautPageState extends State<ListeDeCommunautPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.orange50,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOrange,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 26.h),
                    child: Column(
                      children: [
                        SizedBox(height: 48.v),
                        _buildRowListedeOneSection(context),
                        SizedBox(height: 17.v),
                        _buildCommunityCardSection(context)
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              onTapImage(context);
            },
          ),
          AppbarTitle(
            text: "Liste des Communautés".tr,
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

  /// Section Widget
  Widget _buildRowListedeOneSection(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the children horizontally
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 5.h), // Add horizontal margin
          child: Text(
            "Liste des Communautés".tr, // Display translated text
            style: theme.textTheme.headlineSmall, // Apply a specific text style
          ),
        ),
        SizedBox(width: 0.h), // Add space between Text and IconButton
        IconButton(
          icon: const Icon(Icons.add_circle,
              color: Colors.black), // Display an icon
          iconSize: 30, // Set the icon size
          alignment: Alignment.center, // Align the icon to the center
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CrErCommunautScreen()),
            );
          }, // Callback function when IconButton is pressed
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCommunityCardSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.h,
          right: 5.h,
        ),
        child: Consumer<ListeDeCommunautProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 22.v,
                );
              },
              itemCount: provider
                  .listeDeCommunautModelObj.communitycardsectionItemList.length,
              itemBuilder: (context, index) {
                CommunitycardsectionItemModel model = provider
                    .listeDeCommunautModelObj
                    .communitycardsectionItemList[index];
                return CommunitycardsectionItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  void onTapImage(BuildContext context) {
    NavigatorService.goBack();
  }
}
