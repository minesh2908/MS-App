import 'dart:convert';

class HelperModel {

  HelperModel({required this.parts});

  factory HelperModel.fromMap(Map<String, dynamic> map) {
    return HelperModel(
      parts: List<HelperPartModel>.from(
        (map['parts'] as List<int>).map<HelperPartModel>(
          (x) => HelperPartModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory HelperModel.fromJson(String source) =>
      HelperModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final List<HelperPartModel> parts;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class HelperPartModel {

  HelperPartModel({required this.text});

  factory HelperPartModel.fromMap(Map<String, dynamic> map) {
    return HelperPartModel(
      text: map['text'] as String,
    );
  }

  factory HelperPartModel.fromJson(String source) =>
      HelperPartModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String text;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  String toJson() => json.encode(toMap());
}
