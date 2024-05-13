import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/chat_box_provider.dart';

class ChatBoxScreen extends StatelessWidget {
  const ChatBoxScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatBoxProvider(),
      child: ChatBoxScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.orange50,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            _buildMaleUserOneRow(context),
            SizedBox(height: 50.v),
            Expanded(
              child: Consumer<ChatBoxProvider>(
                builder: (context, provider, _) {
                  return ListView(
                    children: [
                      _buildMessage(context, "Bonjour",
                          isReceived: true, avatar: 'user_avatar1.jpg'),
                      SizedBox(height: 25.v),
                      _buildMessage(context, "bonjour",
                          isReceived: false, avatar: 'user_avatar2.jpg'),
                      SizedBox(height: 25.v),
                      _buildMessage(context, "Faire moi un don?",
                          isReceived: true, avatar: 'user_avatar1.jpg'),
                      SizedBox(height: 25.v),
                      _buildMessage(context, "ok  ",
                          isReceived: false, avatar: 'user_avatar2.jpg'),
                      SizedBox(height: 25.v),
                    ],
                  );
                },
              ),
            ),
            _buildInputField(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMaleUserOneRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 13,
        ),
        decoration: AppDecoration.fillLightGreen.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 60,
              ),
            ),
            SizedBox(width: 11),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " nom de communauté",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context, String message,
      {required bool isReceived, required String avatar}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.10, vertical: 10.10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isReceived)
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
            )
          else
            SizedBox(width: 20), // Placeholder for spacing
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.10),
              decoration: BoxDecoration(
                color: isReceived ? Colors.white : Colors.lightGreen.shade600,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: isReceived ? Radius.circular(5) : Radius.zero,
                  bottomLeft: !isReceived ? Radius.circular(5) : Radius.zero,
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isReceived ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          if (!isReceived)
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
            )
          else
            SizedBox(width: 10), // Placeholder for spacing
        ],
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10), // Adjusted padding
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomTextFormField(
              hintText: 'Type a message...',
            ),
          ),
          IconButton(
            icon: Icon(Icons.tag_faces),
            onPressed: () {
              // Handle attachment button tap
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle send button tap
            },
          ),
        ],
      ),
    );
  }
}
