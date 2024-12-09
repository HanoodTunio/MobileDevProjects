import 'package:flutter/material.dart';
import 'package:seyahat_app/views/screens/user_signup_screen.dart';
import '../../controllers/signup_role_selection_controller.dart';
import '../../core/constants/colors.dart';
import '../widgets/custom_role_option.dart';
import '../widgets/custom_title_box.dart';

class SignupRoleSelectionScreen extends StatelessWidget {
  const SignupRoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0, // To keep the AppBar flat
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors
                  .black), // Set the icon color to black or any contrasting color
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Adjust the space from the AppBar
            const CustomTitleBox(title: "How Would You Like to Join?"),
            const SizedBox(height: 30), // Reduced spacing
            _buildRoleOptions(context),
          ],
        ),
      ),
    );
  }

  /**
   * This method builds the role options for the user_profile.dart to select from.
   */
  Widget _buildRoleOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CustomRoleOption widget for Guide
          CustomRoleOption(
              role: "Guide",
              assetPath: 'assets/guide.png',
              onTap: () => SignupRoleSelectionController()
                  .navigateToGuideSignup(context)),

          // Add spacing between the options
          const SizedBox(height: 20),

          // Divider widget to separate the options
          const Divider(
            color: AppColors.lightGrey,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),

          // Add spacing between the options
          const SizedBox(height: 20),

          // CustomRoleOption widget for User
          CustomRoleOption(
              role: "User",
              assetPath: 'assets/user_profile.dart.png',
              onTap: () => SignupRoleSelectionController()
                  .navigateToUserSignup(context)),
        ],
      ),
    );
  }
}
