
class SlidesModel {
  final List<Slide> slides;

  SlidesModel({required this.slides});

  factory SlidesModel.fromJson(Map<String, dynamic> json) {
    return SlidesModel(
      slides: (json['slides'] as List)
          .map((slideJson) => Slide.fromJson(slideJson))
          .toList(),
    );
  }

  // Convert SlidesModel to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'slides': slides.map((slide) => slide.toJson()).toList(),
    };
  }
}

class Slide {
  final int slideNumber;
  final List<String> texts;
  final List<String> images;

  Slide({required this.slideNumber, required this.texts, required this.images});

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      slideNumber: json['slide_number'] ?? 0,
      texts: List<String>.from(json['texts'] ?? []),
      images: List<String>.from(json['images'] ?? []),
    );
  }

  // Convert Slide to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'slide_number': slideNumber,
      'texts': texts,
      'images': images,
    };
  }
}
