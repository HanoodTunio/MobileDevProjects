// lib/widgets/bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarWidget extends StatelessWidget {
  final PersistentTabController controller;
  final List<Widget> screens;
  final List<PersistentBottomNavBarItem> items;

  const BottomNavBarWidget({
    Key? key,
    required this.controller,
    required this.screens,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: items,
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style3,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
    );
  }
}
