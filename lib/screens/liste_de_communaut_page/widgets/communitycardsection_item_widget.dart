import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/communitycardsection_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CommunitycardsectionItemWidget extends StatelessWidget {
  CommunitycardsectionItemWidget(this.communitycardsectionItemModelObj,
      {Key? key})
      : super(
          key: key,
        );

  CommunitycardsectionItemModel communitycardsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 3.v,
      ),
        decoration: AppDecoration.outlineWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgComponent14,
            height: 99.v,
            width: 93.h,
            radius: BorderRadius.circular(
              12.h,
            ),
            margin: EdgeInsets.only(
              top: 10.v,
              bottom: 15.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 10.v,
            ),
            child: Column(
              children: [
                Text(
                  communitycardsectionItemModelObj.communityName!,
                  style: CustomTextStyles.titleSmallSemiBold,
                ),
                SizedBox(height: 12.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 101.h,
                    child: Text(
                      communitycardsectionItemModelObj.projectName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
               Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit_document),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                  IconButton(
                  icon: Icon(Icons.group_add),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                  IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                SizedBox(width: 3.h), // Add space between buttons
               IconButton(
  icon: Icon(Icons.delete),
  onPressed: () {
    // Show delete confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appTheme.orange50,
          title: Text("Confirmation "),
          content: Text("Voulez-Vous supprimer cette communauté ?"),
          actions: <Widget>[
            TextButton(
              child: Text(
                 "Supprimer",
                 style: TextStyle(color: Color.fromARGB(255, 118, 173, 55)), // Change text color to black
                  ),
               onPressed: () {
                  _deleteItem();
                  Navigator.of(context).pop(); // Close dialog
                     },
                       ),

           TextButton(
           child: Text("Annuler",
              style: TextStyle(color: Color.fromARGB(255, 118, 173, 55))),
           
               onPressed: () {
                 Navigator.of(context).pop();
              },
           ),
           

          ],
        );
      },
    );
  },
),

              ],
            ),
              ],
            ),
          )
        ],
      ),
    );
  }
  // Function to perform delete action
void _deleteItem() {
  print("Communauté supprimée!");
}

}
