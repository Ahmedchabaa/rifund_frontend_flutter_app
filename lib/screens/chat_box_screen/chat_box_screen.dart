import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rifund/screens/affichage_communaut_page/affichage_communaut_page.dart';

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
            _buildHeader(context),
            SizedBox(height: 50),
            Expanded(
              child: Consumer<ChatBoxProvider>(
                builder: (context, provider, _) {
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildMessage(context, "Salut", isReceived: true, avatar: 'assets/images/avatar.png'),
                      SizedBox(height: 10),
                      _buildMessage(context, "Salut", isReceived: false, avatar: 'assets/images/avatar.png'),
                      SizedBox(height: 10),
                      _buildMessage(context, "Don ?", isReceived: true, avatar: 'assets/images/avatar.png'),
                      SizedBox(height: 25),
                      _buildMessage(context, "Ok", isReceived: false, avatar: 'assets/images/avatar.png'),
                      SizedBox(height: 25),
                    ],
                  );
                },
              ),
            ),
            _buildInputField(context),
                 SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      decoration: AppDecoration.fillLightGreen.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 11),
          Expanded(
            child: Text(
              "Nom de communauté",
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AffichageCommunautPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(BuildContext context, String message,
      {required bool isReceived, required String avatar}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isReceived)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
              ),
            ),
          Expanded(
            child: FractionallySizedBox(
              alignment: isReceived ? Alignment.centerLeft : Alignment.centerRight,
              widthFactor: 0.25, // Change this value to set max width percentage
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: isReceived ? Colors.white : Colors.lightGreen.shade600,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: isReceived ? Radius.circular(15) : Radius.zero,
                    bottomLeft: !isReceived ? Radius.circular(15) : Radius.zero,
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
          ),
          if (!isReceived)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Type a message...',
            ),
          ),
          IconButton(
            icon: Icon(Icons.tag_faces),
            onPressed: () {
              // Handle emoji button tap
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
