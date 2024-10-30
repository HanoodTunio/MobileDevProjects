import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarWidget extends StatelessWidget {
  final PersistentTabController controller;
  final List<Widget> screens;
  final List<PersistentBottomNavBarItem> items;
  final NavBarStyle navBarStyle;

  const BottomNavBarWidget({
    Key? key,
    required this.controller,
    required this.screens,
    required this.items,
    this.navBarStyle = NavBarStyle.style1, // Default nav bar style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens, // Screens for each tab
      items: items, // Items for the nav bar
      confineToSafeArea: true,
      backgroundColor: Colors.white, // Set the background color of the nav bar
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // Adjust when keyboard appears
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      navBarHeight: kBottomNavigationBarHeight, // Height of the nav bar
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400), // Duration for the item animation
          curve: Curves.ease, // Animation curve
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true, // Animate transition between tabs
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn, // Type of screen transition
        ),
      ),
      navBarStyle: NavBarStyle.style12, // Style of the nav bar
    );
  }
}



