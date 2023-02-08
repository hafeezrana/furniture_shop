import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
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
  int itemIndex = 0;
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const FavoriteScreen(),
      const NotificationScreen(),
      const MyProfilesScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "home",
        activeColorPrimary: ConstColors.green,
        inactiveColorPrimary: ConstColors.black3,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: "favorite",
        activeColorPrimary: ConstColors.green,
        inactiveColorPrimary: ConstColors.black3,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_none),
        title: "notifiacation",
        activeColorPrimary: ConstColors.green,
        inactiveColorPrimary: ConstColors.black3,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: "profile",
        activeColorPrimary: ConstColors.green,
        inactiveColorPrimary: ConstColors.black3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,

      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: ConstColors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: ConstColors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  // - -------------------------------- - --           -
  // int selectedIndex = 0;

  // @override
  // Widget build(BuildContext context) {
  //   List navScreens = [
  //     const HomeScreen(),
  //     const FavoriteScreen(),
  //     const NotificationScreen(),
  //     const MyProfilesScreen(),
  //   ];

  //   return Scaffold(
  //     body: navScreens.elementAt(selectedIndex),
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: selectedIndex,
  //       iconSize: 34,
  //       selectedItemColor: ConstColors.green,
  //       unselectedItemColor: ConstColors.black2,
  //       elevation: 10,
  //       onTap: (value) {
  //         setState(() {
  //           selectedIndex = value;
  //         });
  //       },
  //       items: const [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.home_outlined), label: 'home'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.bookmark_border_outlined), label: 'favorite'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.notifications_none), label: 'notification'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.person_outline), label: 'profile'),
  //       ],
  //     ),
  //   );
  // }
}
