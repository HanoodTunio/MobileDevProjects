// lib/models/splash_model.dart

class SplashModel {
  final String title;
  final String description;
  final String logoPath;
  final int splashDuration;

  SplashModel({
    required this.title,
    required this.description,
    required this.logoPath,
    this.splashDuration = 3, // Default splash duration
  });

  // A default instance with example values
  static SplashModel getDefault() {
    return SplashModel(
      title: "Welcome to MyApp",
      description: "Your journey starts here!",
      logoPath: 'assets/logo.png', // Path to the splash screen logo
      splashDuration: 3,
    );
  }
}
