// lib/controllers/guide_signup_controller.dart

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth/guide_auth_service.dart';
import '../views/screens/guide/success_signup_screen.dart';
import '../views/widgets/custom_snackbar_widget.dart';

class GuideSignupController extends GetxController {
  // Text editing controllers for guide-specific input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController experienceLevelController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController specialtiesController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();

  final TextEditingController aboutController = TextEditingController();
  final TextEditingController socialMediaLinksController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();

  // Reactive variable for the ID card image path
  var imagePath = ''.obs;
  final GuideAuthService guideAuthService;

  GuideSignupController({required this.guideAuthService});

  /// Function to handle ID card image picking
  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.single.path != null) {
      imagePath.value = result.files.single.path!;
    }
  }

  /// Displays a custom snack bar with a message
  void _showErrorMessage(BuildContext context, String message) {
    CustomSnackBar.show(
      context,
      message: message,
      backgroundColor: Colors.white70,
      textColor: Colors.red,
    );
  }

  /// Validates the fields on the first screen and provides specific feedback
  bool validateScreen1(BuildContext context) {
    if (nameController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your name.');
      return false;
    } else if (cnicController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your CNIC.');
      return false;
    } else if (phoneController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your phone number.');
      return false;
    } else if (emailController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your email.');
      return false;
    } else if (passwordController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your password.');
      return false;
    }
    return true;
  }

  /// Validates the fields on the second screen and provides specific feedback
  bool validateScreen2(BuildContext context) {
    if (experienceLevelController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your experience level.');
      return false;
    } else if (languageController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your language proficiency.');
      return false;
    } else if (specialtiesController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your specialties.');
      return false;
    } else if (certificationController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your certifications.');
      return false;
    } else if (availabilityController.text.isEmpty) {
      _showErrorMessage(context, 'Please enter your availability.');
      return false;
    }
    return true;
  }

  /// Validates the fields on the third screen and provides specific feedback
  bool validateScreen3(BuildContext context) {
    if (aboutController.text.isEmpty) {
      _showErrorMessage(context, 'Please provide information about yourself.');
      return false;
    }
    return true;
  }

  /// Function to handle final submission of the guide sign-up form
  Future<void> submitSignup(BuildContext context) async {
    if (!validateScreen1(context) || !validateScreen2(context) || !validateScreen3(context)) return;

    // Attempt to register the guide with GuideAuthService
    bool isRegistered = await guideAuthService.registerGuide(
      name: nameController.text.trim(),
      cnic: cnicController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      experienceLevel: experienceLevelController.text.trim(),
      language: languageController.text.trim(),
      specialties: specialtiesController.text.trim(),
      certification: certificationController.text.trim(),
      availability: availabilityController.text.trim(),
      about: aboutController.text.trim(),
      socialMediaLinks: socialMediaLinksController.text.trim(),
      paymentMethod: paymentMethodController.text.trim(),
      idCardImagePath: imagePath.value,
    );

    // Show feedback and navigate to the success screen if registration is successful
    if (isRegistered) {
      CustomSnackBar.show(
        context,
        message: 'Sign-Up Successful! Welcome!',
        backgroundColor: Colors.white70,
        textColor: Colors.green,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessSignupScreen(
            username: nameController.text.trim(),
          ),
        ),
      );
    } else {
      CustomSnackBar.show(
        context,
        message: 'Sign-Up Failed. Please try again.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );
    }
  }

  /// Dispose all text editing controllers to free memory
  @override
  void dispose() {
    nameController.dispose();
    cnicController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    experienceLevelController.dispose();
    languageController.dispose();
    specialtiesController.dispose();
    certificationController.dispose();
    availabilityController.dispose();
    aboutController.dispose();
    socialMediaLinksController.dispose();
    paymentMethodController.dispose();
    super.dispose();
  }
}
