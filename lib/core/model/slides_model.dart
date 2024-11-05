class SlidesModel {
  List<String>? slidesText;

  SlidesModel({this.slidesText});

  // Use proper type safety to avoid casting errors.
  factory SlidesModel.fromJson(Map<String, dynamic> json) {
    return SlidesModel(
      slidesText: (json['slides_text'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slides_text': slidesText,
    };
  }
}
