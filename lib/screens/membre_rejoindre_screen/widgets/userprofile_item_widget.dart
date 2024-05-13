import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/userprofile_item_model.dart';

class UserprofileItemWidget extends StatelessWidget {
  final UserprofileItemModel userprofileItemModelObj;

  const UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.outlineLightgreen6001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: userprofileItemModelObj.userImage!,
            height: 55.v,
            width: 39.h,
            margin: EdgeInsets.only(bottom: 20.v,top: 20),
          ),
          SizedBox(width: 12.h), // Add some space between image and username
          Expanded(
            child: Text(
              userprofileItemModelObj.username!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(width: 23.h), // Add space between username and actions
          Container(
            height: 32.v,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.green),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                SizedBox(width: 3.h), // Add space between buttons
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
