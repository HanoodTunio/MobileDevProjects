import 'package:flutter/material.dart';
import 'package:seyahat_app/views/screens/personal_chat_screen.dart';
import '../screens/guide_profile.dart';

class GuideCard extends StatelessWidget {
  final String username;
  final String profilePicture;
  final String description;
  final double rating;
  final int reviewCount;

  const GuideCard({
    super.key,
    required this.username,
    required this.profilePicture,
    required this.description,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Set the fixed width for the card
      height: 150, // Set the fixed height for the card
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profilePicture),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      if (index < rating) {
                        return const Icon(Icons.star, color: Colors.amber, size: 10);
                      } else if (index < rating + 0.5) {
                        return const Icon(Icons.star_half, color: Colors.amber, size: 10);
                      } else {
                        return const Icon(Icons.star_border, color: Colors.amber, size: 10);
                      }
                    }),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$reviewCount reviews',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(70, 30),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GuideProfile(
                                  username: username,
                                  profilePicture: profilePicture,
                                  description: description,
                                  rating: rating,
                                  reviewCount: reviewCount,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'View Profile',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          icon: const Icon(Icons.message, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalChatScreen(
                                  contactName: username, // Pass username as contactName
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
