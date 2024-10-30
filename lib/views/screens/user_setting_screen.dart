import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../controllers/user_controller.dart';
import '../../models/user_model.dart';
import '../widgets/custom_button.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  File? _profileImage;

  // Controllers for the form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  // Function to pick an image and update the profile picture
  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _profileImage = File(pickedImage.path); // Update _profileImage with the selected file
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // Populate controllers with data from the API
  void _populateControllers(UserModel user) {
    _nameController.text = user.name;
    _emailController.text = user.email;
    _passwordController.text = user.password;
    _phoneController.text = user.phoneNumber;
    _countryController.text = user.country;
  }

  // Save changes using UserController
  void _saveChanges(UserController controller) {
    if (_formKey.currentState!.validate()) {
      final updatedUser = UserModel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phoneNumber: _phoneController.text,
        country: _countryController.text,
      );
      controller.updateUserProfile(updatedUser);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userController = Provider.of<UserController>(context, listen: false);

    // Load the user data and populate controllers if data is loaded successfully
    if (userController.user == null) {
      userController.loadUserProfile().then((_) {
        if (userController.user != null) {
          _populateControllers(userController.user!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    if (userController.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : const AssetImage('assets/user2.png') as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.white, size: 15),
                          onPressed: _pickImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Please enter your name" : null,
              ),
              const SizedBox(height: 15),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? "Please enter your email" : null,
              ),
              const SizedBox(height: 15),

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) => value!.isEmpty ? "Please enter your password" : null,
              ),
              const SizedBox(height: 15),

              // Phone Number Field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone number"),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),

              // Country/Region Field
              TextFormField(
                controller: _countryController,
                decoration: const InputDecoration(labelText: "Country/Region"),
              ),
              const SizedBox(height: 30),

              // Save Changes Button using CustomButton
              CustomButton(
                onPressed: () => _saveChanges(userController),
                label: 'Save changes',
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                fontSize: 11.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
