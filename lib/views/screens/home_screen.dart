import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:seyahat_app/views/screens/personal_chat_screen.dart';
import '../../views/screens/main_messages_screen.dart';
import '../../views/screens/search_guide_screen.dart';
import '../../views/screens/user_notification_screen.dart';
import '../../views/screens/user_setting_screen.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../controllers/suggested_place_controller.dart';
import 'package:provider/provider.dart';
import '../widgets/suggested_place_card.dart';
import '../widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  String _appBarTitle = "Home"; // Default title set to "Home"

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _controller.addListener(_updateAppBarTitle); // Attach listener to update title on tab change
  }

  @override
  void dispose() {
    _controller.removeListener(_updateAppBarTitle); // Remove listener when widget is disposed
    _controller.dispose();
    super.dispose();
  }

  // Method to update the AppBar title based on the current tab index
  void _updateAppBarTitle() {
    setState(() {
      _appBarTitle = getAppBarTitle(_controller.index);
    });
  }

  // Helper function to get title based on tab index
  String getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Search Guide";
      case 2:
        return "Messages";
      case 3:
        return "Notifications";
      case 4:
        return "Settings";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          _appBarTitle,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: BottomNavBarWidget(
        controller: _controller,
        screens: _buildScreens(),
        items: _buildNavBarItems(),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      _homeScreenContent(),
      const SearchGuideScreen(),
      MainMessagesScreen(
        onOpenChat: (String contactName) {
          // Open PersonalChatScreen without changing the HomeScreen title
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PersonalChatScreen(contactName: contactName),
            ),
          );
        },
      ),
      UserNotificationScreen(),
      const UserSettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.travel_explore),
        title: ("Search Guide"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat_bubble_outline),
        title: ("Messages"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_outlined),
        title: ("Notifications"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_outlined),
        title: ("Settings"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  Widget _homeScreenContent() {
    return ChangeNotifierProvider<SuggestedPlaceController>(
      create: (context) => SuggestedPlaceController()..fetchSuggestedPlaces(),
      child: Consumer<SuggestedPlaceController>(
        builder: (context, controller, child) {
          if (controller.isLoading) return const Center(child: CircularProgressIndicator());
          if (controller.error != null) return Center(child: Text(controller.error!));
          return ListView(
            padding: const EdgeInsets.all(0),
            children: [
              CustomSearchBar(
                hintText: 'Search for places',
                onChanged: (value) => print('Search query: $value'),
              ),
              const SizedBox(height: 16),
              Text(
                '   Suggested Places',
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ...controller.places.map((place) => SuggestedPlaceCard(
                placeName: place.placeName,
                imagePath: place.imagePath,
                description: place.description,
              )),
            ],
          );
        },
      ),
    );
  }
}
