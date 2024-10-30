// lib/controllers/splash_controller.dart
import 'dart:async';
import '../models/splash_model.dart';

class SplashController {
  final SplashModel model = SplashModel.getDefault(); // Using default model instance

  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: model.splashDuration));
  }
}
