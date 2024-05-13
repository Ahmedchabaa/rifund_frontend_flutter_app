import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../widgets/bottomNavBar.dart';
import 'models/affichage_communaut_container_model.dart';
import 'provider/affichage_communaut_container_provider.dart';

class AffichageCommunautContainerScreen extends StatefulWidget {
  const AffichageCommunautContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AffichageCommunautContainerScreenState createState() =>
      AffichageCommunautContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AffichageCommunautContainerProvider(),
      child: AffichageCommunautContainerScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AffichageCommunautContainerScreenState
    extends State<AffichageCommunautContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(),
      bottomNavigationBar: BottomNavBar(),
      ),
    );
    
  }

  /// Section Widget

  ///Handling route based on bottom click actions


  ///Handling page based on route
 
}

