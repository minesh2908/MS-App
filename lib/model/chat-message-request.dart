// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessageRequestModel {
  final String role;
  final List<ChatPartsMessageModel> parts;

  ChatMessageRequestModel({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatMessageRequestModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageRequestModel(
      role: map['role'] as String,
      parts: List<ChatPartsMessageModel>.from(
        (map['parts'] as List<int>).map<ChatPartsMessageModel>(
          (x) => ChatPartsMessageModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageRequestModel.fromJson(String source) =>
      ChatMessageRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class ChatPartsMessageModel {
  final String text;

  ChatPartsMessageModel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory ChatPartsMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatPartsMessageModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatPartsMessageModel.fromJson(String source) =>
      ChatPartsMessageModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
