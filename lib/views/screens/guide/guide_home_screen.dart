// lib/views/screens/guide/guide_home_screen.dart

import 'package:flutter/material.dart';
import '../../widgets/guide/bookings_row.dart';
import '../../widgets/guide/dashboard_card.dart';
import '../../widgets/guide/rating_widget.dart';
import '../../widgets/guide/user_profile.dart';

class GuideHomeScreen extends StatelessWidget {
  final String username;

  const GuideHomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
           // UserProfile(username: username),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(
                  child: DashboardCard(
                    title: 'Experience',
                    icon: Icons.bar_chart_rounded,
                    iconSize: 100,
                    content: '5 years',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Response Time',
                    icon: Icons.timer_rounded,
                    iconSize: 90,
                    content: '1 hour',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: const Color(0xFFFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1A76D2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          RatingWidget(rating: 4.0),
                          SizedBox(height: 8),
                          Text(
                            '4.0/5',
                            style: TextStyle(
                              color: Color(0xFF1A76D2),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    title: 'Success Score',
                    content: '80%',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        LinearProgressIndicator(
                          minHeight: 10,
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation(Colors.green),
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const BookingsRow(bookings: '2 / 5'),
            const SizedBox(height: 20),
            const Text(
              'To do',
              style: TextStyle(
                color: Color(0xFF1A76D2),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifications to ponder',
                  style: TextStyle(
                    color: Color(0xFF1A76D2),
                    fontSize: 20,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1A76D2),
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
