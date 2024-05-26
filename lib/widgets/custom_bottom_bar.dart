import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      onTap: (index) {
        switch (index) {
          case 0:
            // Navigate to home page
            Navigator.pushNamed(context, '//admin_projet_screen');
            break;
          case 1:
            // Navigate to add note page
            Navigator.pushNamed(context, '/admin_utlisa_page');
            break;
          case 2:
            // Navigate to notifications page
            Navigator.pushNamed(context, '/admin_cat_gorie_screen');
            break;
          case 3:
            // Navigate to notifications page
            Navigator.pushNamed(context, '/admin_communaut_screen');
            break;
          case 4:
            // Navigate to profile page
            Navigator.pushNamed(context, '/profile_admin_page');
            break;
          default:
            break;
        }
      },
      height: 70,
      color: Colors.lightGreen.shade600,
      items: [
        Icon(
          Icons.business,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.person_add,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.category,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.chat,
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
