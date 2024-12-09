import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/image_picker_controller.dart';
import '../../widgets/custom_textfield_widget.dart';
import 'success_signup_screen.dart'; // Import SuccessSignupScreen

class GuideSignUpScreen3 extends StatelessWidget {
  const GuideSignUpScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController aboutController = TextEditingController();
    final ImagePickerController controller = Get.put(ImagePickerController());
    final TextEditingController socialMediaLinksController = TextEditingController();
    final TextEditingController paymentMethodController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Join as a Guide',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
            const SizedBox(height: 37),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),
            CustomTextField(
              controller: aboutController,
              hintText: 'About Me/Bio',
              prefixIcon: const Icon(Icons.account_circle, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: controller.getImage,
              child: Obx(() {
                return Container(
                  width: 400,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                    image: controller.imagePath.value.isNotEmpty
                        ? DecorationImage(
                      image: kIsWeb
                          ? NetworkImage(controller.imagePath.value) as ImageProvider
                          : FileImage(File(controller.imagePath.value)),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: controller.imagePath.value.isEmpty
                      ? const Text(
                    "Upload CNIC",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
                      : null,
                );
              }),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: socialMediaLinksController,
              hintText: 'Social Media Links (Optional)',
              prefixIcon: const Icon(Icons.add_link_outlined, color: Color(0xFF1A76D2)),
            ),
            CustomTextField(
              controller: paymentMethodController,
              hintText: 'Payment Method (Optional)',
              prefixIcon: const Icon(Icons.payment, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to SuccessSignupScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessSignupScreen(username: 'Hanood',),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A76D2),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                "Signup",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
