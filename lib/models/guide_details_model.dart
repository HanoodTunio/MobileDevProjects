class GuideDetails {
  final String id;
  final String username;
  final String profilePicture;
  final String bio; // Detailed description or bio

  // Additional fields for detailed admin view
  final String contactInfo;
  final String email;
  final String experience;
  final String language;
  final String specialties;
  final String certificate;
  final String socialMediaLinks;
  final String status;

  GuideDetails({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.bio,
    required this.contactInfo,
    required this.email,
    required this.experience,
    required this.language,
    required this.specialties,
    required this.certificate,
    required this.socialMediaLinks,
    required this.status,
  });

  // Factory constructor to create a GuideDetails from a JSON object
  factory GuideDetails.fromJson(Map<String, dynamic> json) {
    return GuideDetails(
      id: json['id'] as String,
      username: json['username'] as String,
      profilePicture: json['profile_picture'] as String,
      bio: json['bio'] as String,
      contactInfo: json['contact_info'] as String,
      email: json['email'] as String,
      experience: json['experience'] as String,
      language: json['language'] as String,
      specialties: json['specialties'] as String,
      certificate: json['certificate'] as String,
      socialMediaLinks: json['social_media_links'] as String,
      status: json['status'] as String,
    );
  }

  // Convert a GuideDetails to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'profile_picture': profilePicture,
      'bio': bio,
      'contact_info': contactInfo,
      'email': email,
      'experience': experience,
      'language': language,
      'specialties': specialties,
      'certificate': certificate,
      'social_media_links': socialMediaLinks,
      'status': status,
    };
  }
}
