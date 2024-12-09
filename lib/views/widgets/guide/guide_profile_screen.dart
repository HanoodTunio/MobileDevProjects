import 'package:flutter/material.dart';
import '../../widgets/guide/profile_section.dart';
import '../../widgets/guide/about_section.dart';
import '../../widgets/guide/reviews_section.dart';

class GuideProfileScreen extends StatelessWidget {
  const GuideProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Guide Profile'),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Section
              ProfileSection(screenWidth: screenWidth),
              // TabBar
              const TabBar(
                indicatorColor: Colors.blueAccent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Reviews"),
                ],
              ),
              // TabBarView
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const TabBarView(
                  children: [
                    AboutSection(),
                    ReviewsSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
