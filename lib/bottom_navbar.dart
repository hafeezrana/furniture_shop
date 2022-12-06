import 'package:flutter/material.dart';
import '../utils/constants/colors_consts.dart';
import 'favorites/favorites_screen.dart';
import 'home/home_screen.dart';
import 'notification/notification_screen.dart';
import 'profile/my_profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  static const route = '/bottomNavScrn';

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List navScreens = [
      const HomeScreen(),
      const FavoriteScreen(),
      const NotificationScreen(),
      const MyProfilesScreen(),
    ];

    return Scaffold(
      body: navScreens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        iconSize: 34,
        selectedItemColor: ConstColors.green,
        unselectedItemColor: ConstColors.black2,
        elevation: 10,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: 'notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'profile'),
        ],
      ),
    );
  }
}
