import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/guide/custom_dropdown.dart';
import 'guide_signup_screen3.dart';
import 'package:flutter/foundation.dart'; // Required for kIsWeb


class GuideSignUpScreen2 extends StatelessWidget {
  const GuideSignUpScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController experienceLevelController = TextEditingController();
    final TextEditingController languageController = TextEditingController();
    final TextEditingController certificationController = TextEditingController();
    final TextEditingController availabilityController = TextEditingController();

    // Reactive variable to store the selected certificate image path
    RxString certificateImagePath = ''.obs;

    Future<void> pickCertificateImage() async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        certificateImagePath.value = result.files.single.path!;
      }
    }

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
                'Guide Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomDropdownField(
              controller: experienceLevelController,
              hintText: 'Experience Level',
              prefixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xFF1A76D2)),
              options: ['Beginner', 'Intermediate', 'Advanced'],
            ),
            const SizedBox(height: 10),
            CustomDropdownField(
              controller: languageController,
              hintText: 'Languages',
              prefixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xFF1A76D2)),
              options: ['English', 'Sindhi', 'Urdu'],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: certificationController,
              hintText: 'Certification',
              prefixIcon: const Icon(Icons.ac_unit_outlined, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: availabilityController,
              hintText: 'Availability',
              prefixIcon: const Icon(Icons.access_time_filled_sharp, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 20),

            // Certificate Image Picker
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload Certificate/Proof',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A76D2),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: pickCertificateImage,
              child: Obx(() {
                return Container(
                  width: 400,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                    image: certificateImagePath.value.isNotEmpty
                        ? DecorationImage(
                      image: kIsWeb
                          ? NetworkImage(certificateImagePath.value) as ImageProvider
                          : FileImage(File(certificateImagePath.value)),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: certificateImagePath.value.isEmpty
                      ? const Text(
                    "Upload Certificate",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                  )
                      : null,
                );
              }),
            ),
            const SizedBox(height: 45),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Previous', style: TextStyle(fontSize: 16, color: Colors.orange)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuideSignUpScreen3(),
                      ),
                    );
                  },
                  child: const Text('Next', style: TextStyle(fontSize: 16, color: Colors.orange)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
