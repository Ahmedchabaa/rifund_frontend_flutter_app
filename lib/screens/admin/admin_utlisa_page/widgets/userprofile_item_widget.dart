import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/userprofile_item_model.dart'; // ignore: must_be_immutable

class UserprofileItemWidget extends StatefulWidget {
  final UserprofileItemModel userprofileItemModelObj;

  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(key: key);

  @override
  _UserprofileItemWidgetState createState() => _UserprofileItemWidgetState();
}

class _UserprofileItemWidgetState extends State<UserprofileItemWidget> {
  bool isChecked = false;

  void _toggleChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.0, // Use .0 to ensure proper EdgeInsets syntax
        vertical: 4.0, // Use .0 to ensure proper EdgeInsets syntax
      ),
      decoration: AppDecoration.outlineLightgreen600.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              isChecked ? Icons.check : Icons.clear,
              color: isChecked ? Colors.green : Colors.red,
            ),
            onPressed: _toggleChecked,
          ),
          SizedBox(width: 10.0), // Use .0 to ensure proper SizedBox syntax
       
  Container(
  width: 110.0, // Set width to 110.0
  margin: EdgeInsets.only(
    left: 16.0, // Left margin of 16.0
    top: 13.0, // Top margin of 13.0
  ),
  child: Text(
    widget.userprofileItemModelObj.userEmail ?? 'No email provided',
    overflow: TextOverflow.ellipsis, // Use ellipsis to indicate overflow
    maxLines: 1, // Ensure the text is on a single line
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      height: 1.40, // Line height set to 1.40
    ),
  ),
),

          Expanded(
            child: Container(), // Spacer to push delete icon to the right
          ),
          Container(
            height: 32.0, // Use .0 to ensure proper Container size syntax
            width: 32.0, // Use .0 to ensure proper Container size syntax
            margin: EdgeInsets.only(
              left: 16.0, // Use .0 to ensure proper EdgeInsets syntax
              top: 13.0, // Use .0 to ensure proper EdgeInsets syntax
              bottom: 13.0, // Use .0 to ensure proper EdgeInsets syntax
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.black),
                  alignment: Alignment.bottomRight,
                  onPressed: () {
                     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Voulez-vous supprimer ce utilisateur"),
          actions: [
            TextButton(
              onPressed: () {
                // Perform delete operation here
                Navigator.of(context).pop();
              },
              child: Text("Oui"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annuler"),
            ),
          ],
        );
        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
