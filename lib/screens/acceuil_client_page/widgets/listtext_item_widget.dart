import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_text_style.dart';
import '../models/listtext_item_model.dart'; 

// ignore_for_file: must_be_immutable
class ListtextItemWidget extends StatelessWidget {
  final ListtextItemModel listtextItemModelObj;
  final VoidCallback? onTap; // Define onTap parameter

  const ListtextItemWidget(
    this.listtextItemModelObj, {
    Key? key,
    this.onTap, // Include onTap in constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Use GestureDetector to handle tap
      onTap: onTap,
      child: SizedBox(
        width: 145.h,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.h,
              vertical: 1.v,
            ),
            decoration: AppDecoration.outlineLightgreen6001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Column(
              children: [
                SizedBox(height: 15.v),
                CustomImageView(
                  alignment: Alignment.center,
                  imagePath: listtextItemModelObj.image!,
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 9.v),
                Text(
                  listtextItemModelObj.text!,
                  textAlign: TextAlign.center, // Center the text
                  style: CustomTextStyles.bodyMediumLight,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
