import 'package:flutter/material.dart';
import '../../models/review_model.dart';
import '../../services/guide_service.dart';
import '../widgets/guide_review.dart';

class GuideProfile extends StatefulWidget {
  final String username;
  final String profilePicture;
  final String description;
  final double rating;
  final int reviewCount;

  const GuideProfile({
    Key? key,
    required this.username,
    required this.profilePicture,
    required this.description,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  _GuideProfileState createState() => _GuideProfileState();
}

class _GuideProfileState extends State<GuideProfile> {
  late Future<List<Review>> _reviewsFuture;

  @override
  void initState() {
    super.initState();
    _reviewsFuture = GuideService().fetchReviews(widget.username);
  }

  void _openMessageScreen() {
    // Navigate to message screen when floating button is pressed
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessageScreen(username: widget.username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Centered Profile Picture
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(widget.profilePicture),
                  ),
                ),
                const SizedBox(height: 16),

                // Centered Username and Rating
                Text(
                  widget.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'City Explorer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Star Rating with Review Count
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        if (index < widget.rating) {
                          return const Icon(Icons.star, color: Colors.amber, size: 20);
                        } else if (index < widget.rating + 0.5) {
                          return const Icon(Icons.star_half, color: Colors.amber, size: 20);
                        } else {
                          return const Icon(Icons.star_border, color: Colors.amber, size: 20);
                        }
                      }),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(${widget.reviewCount} reviews)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // About Section with Left-Aligned Description
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Reviews Section Title
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Scrollable Reviews List
                FutureBuilder<List<Review>>(
                  future: _reviewsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No reviews found'));
                    }

                    final reviews = snapshot.data!;
                    return ListView.separated(
                      shrinkWrap: true, // Shrink wrap to fit in the scroll view
                      physics: const NeverScrollableScrollPhysics(), // Disable ListView's scrolling
                      itemCount: reviews.length,
                      separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return GuideReview(review: review); // Use GuideReview widget
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          // Floating Message Button
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _openMessageScreen,
              mini: true, // Sets the FAB to a smaller size
              child: const Icon(Icons.message),
              backgroundColor: Color(0x5FA3D8FF),
            ),
          ),

        ],
      ),
    );
  }
}

// Dummy MessageScreen for demonstration
class MessageScreen extends StatelessWidget {
  final String username;

  const MessageScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message $username'),
      ),
      body: Center(
        child: Text('Messaging screen for $username'),
      ),
    );
  }
}
