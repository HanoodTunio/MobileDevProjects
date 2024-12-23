import '../models/user_model.dart';

class UserService {
  // Simulate fetching user_profile.dart profile data with dummy data
  Future<UserModel> getUserProfile() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));

    // Return dummy user_profile.dart data
    return UserModel(
      name: "John Doe",
      email: "john.doe@example.com",
      password: "********",
      phoneNumber: "123-456-7890",
      country: "USA",
    );
  }

  // Simulate updating user_profile.dart profile without actual API call
  Future<void> updateUserProfile(UserModel user) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));

    // Print updated data to console (for debugging purposes)
    print("User profile updated: ${user.toJson()}");
  }
}
