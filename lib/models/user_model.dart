class UserModel {
  String name;
  String email;
  String password;
  String phoneNumber;
  String country;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.country,
  });

  // Convert a UserModel to a Map for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'country': country,
    };
  }

  // Create a UserModel from a Map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      country: json['country'],
    );
  }
}
