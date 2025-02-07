class SuitePhotosArguments {
  final List<String> photos;

  SuitePhotosArguments({
    required this.photos,
  });

  Map<String, dynamic> toJson() {
    return {
      'fotos': photos,
    };
  }

  factory SuitePhotosArguments.fromJson(Map<String, dynamic> json) {
    return SuitePhotosArguments(
      photos: json['fotos'] as List<String>,
    );
  }
}
