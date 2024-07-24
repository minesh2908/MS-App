class TryItModel {
  TryItModel({
    required this.launchUrl,
    required this.title,
  });

  factory TryItModel.fromJson(Map<String, dynamic> json) {
    return TryItModel(
      launchUrl: json['launchUrl'] as Uri,
      title: json['title'] as String,
    );
  }
  final Uri launchUrl;
  final String title;

  TryItModel copyWith({
    Uri? launchUrl,
    String? title,
  }) {
    return TryItModel(
      launchUrl: launchUrl ?? this.launchUrl,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'launchUrl': launchUrl.toString(),
      'title': title,
    };
  }
}
