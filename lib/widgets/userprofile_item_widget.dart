import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../screens/listeprojets/models/userprofile_item_model.dart';
import '../screens/modifierscreen/modifierprojetscreen.dart';
// ignore_for_file: must_be_immutable

class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: 96.v,
        width: 314.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 60.h,
                margin: EdgeInsets.only(
                  left: 75.h,
                  right: 45.h,
                  bottom: 27.v,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 1.v),
                    Text(
                      userprofileItemModelObj.seventy!,
                      style: theme.textTheme.labelMedium,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 14.v,
                width: 141.h,
                margin: EdgeInsets.only(bottom: 27.v),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(
                    7.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.outlinePrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 14),
                    CustomImageView(
                      imagePath: userprofileItemModelObj.circleimage!,
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      radius: BorderRadius.circular(
                        29.h,
                      ),
                      margin: EdgeInsets.only(
                        top: 3.v,
                        bottom: 17.v,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 17.h,
                          top: 1.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.v),
                                  child: Text(
                                    userprofileItemModelObj.titreduprojet!,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                                SizedBox(
                                  height: 32.adaptSize,
                                  width: 32.adaptSize,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: IconButton(
                                          onPressed: () {},
                                          constraints: BoxConstraints(
                                            minHeight: 32.adaptSize,
                                            minWidth: 32.adaptSize,
                                          ),
                                          padding: EdgeInsets.all(0),
                                          icon: SizedBox(
                                            width: 32.adaptSize,
                                            height: 32.adaptSize,
                                            child: IconButton(
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.red),
                                              iconSize: 20,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title:
                                                          Text("Confirmation"),
                                                      content: Text(
                                                          "Voulez-vous supprimer ce projet"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            // Perform delete operation here
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("Oui"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              Text("Annuler"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 11.v),
                            SizedBox(
                              height: 32.adaptSize,
                              width: 32.adaptSize,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.black),
                                    iconSize: 20,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ModifierProjetScreen()),
                                      );
                                    },
                                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
