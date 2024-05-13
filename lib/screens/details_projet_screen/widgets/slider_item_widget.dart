import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/slider_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SliderItemWidget extends StatelessWidget {
  SliderItemWidget(this.sliderItemModelObj, {Key? key})
      : super(
          key: key,
        );

  SliderItemModel sliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage,
          height: 200.v,
          width: 331.h,
          radius: BorderRadius.circular(
            12.h,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgImage258x2,
          height: 258.v,
          width: 2.h,
          radius: BorderRadius.circular(
            1.h,
          ),
          margin: EdgeInsets.only(left: 8.h),
        )
      ],
    );
  }
}
