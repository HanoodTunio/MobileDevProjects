// lib/views/screens/guide/vendor_dashboard.dart

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/guide/guide_profile_screen.dart';
import 'guide_home_screen.dart';
import 'guide_messages_screen.dart';
import 'guide_notification_screen.dart';

class VendorDashboard extends StatelessWidget {
  final String username;
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  VendorDashboard({super.key, required this.username});

  // Define the screens for each tab
  List<Widget> _buildScreens() {
    return [
      GuideHomeScreen(username: username), // Home screen (dashboard)
      const GuideNotificationScreen(),      // Notifications screen
      const GuideMessagesScreen(),          // Messages screen
      const GuideProfileScreen(),          // Settings screen
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavBarWidget(
      controller: _controller,
      screens: _buildScreens(),
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications),
          title: "Notifications",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.message),
          title: "Messages",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Profile",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
    );
  }
}
