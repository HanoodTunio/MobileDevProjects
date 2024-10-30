// lib/models/suggested_place_model.dart

class SuggestedPlace {
  final String placeName;
  final String imagePath;
  final String description;

  SuggestedPlace({
    required this.placeName,
    required this.imagePath,
    required this.description,
  });

  // Factory constructor to create a SuggestedPlace from a JSON object
  factory SuggestedPlace.fromJson(Map<String, dynamic> json) {
    return SuggestedPlace(
      placeName: json['place_name'], // Adjust key names based on your API response
      imagePath: json['image_path'],
      description: json['description'],
    );
  }
}
