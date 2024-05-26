import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      onTap: (index) {
        switch (index) {
          case 0:
            // Navigate to home page
            Navigator.pushNamed(context, '/acceuil_client_page');
            break;
          case 1:
            // Navigate to add note page
            Navigator.pushNamed(context, '/creationprojet');
            break;
          case 2:
            // Navigate to notifications page
            Navigator.pushNamed(context, '/notification_page');
            break;
          case 3:
            // Navigate to profile page
            Navigator.pushNamed(context, '/profile_screen');
            break;
          default:
            break;
        }
      },
      height: 70,
      color: Colors.lightGreen.shade600,
      items: const [
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.note_add,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.notifications_active,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
