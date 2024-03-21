// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HelperModel {
  final List<HelperPartModel> parts;

  HelperModel({required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory HelperModel.fromMap(Map<String, dynamic> map) {
    return HelperModel(
      parts: List<HelperPartModel>.from((map['parts'] as List<int>).map<HelperPartModel>((x) => HelperPartModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory HelperModel.fromJson(String source) => HelperModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class HelperPartModel {
  final String text;

  HelperPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory HelperPartModel.fromMap(Map<String, dynamic> map) {
    return HelperPartModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HelperPartModel.fromJson(String source) => HelperPartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
