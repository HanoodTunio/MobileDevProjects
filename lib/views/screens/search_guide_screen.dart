// lib/views/screens/search_guide_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/guide_search_controller.dart';
import '../widgets/guide_card.dart';
import '../widgets/custom_search_bar.dart'; // Custom Search Bar

class SearchGuideScreen extends StatelessWidget {
  const SearchGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<GuideController>(
        create: (context) => GuideController(),
        child: Consumer<GuideController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                CustomSearchBar(
                  hintText: 'Search for guides',
                  onChanged: (query) {
                    // Trigger search
                    context.read<GuideController>().fetchGuides(query);
                  },
                ),
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.error != null
                      ? Center(child: Text(controller.error!))
                      : ListView.builder(
                    itemCount: controller.guides.length,
                    itemBuilder: (context, index) {
                      final guide = controller.guides[index];
                      return GuideCard(
                        username: guide.username,
                        profilePicture: guide.profilePicture,
                        description: guide.description,
                        rating: guide.rating,
                        reviewCount: guide.reviewCount,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
