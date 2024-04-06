import 'dart:convert';

class ChatMessageRequestModel {
  ChatMessageRequestModel({required this.role, required this.parts});

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

  factory ChatMessageRequestModel.fromJson(String source) =>
      ChatMessageRequestModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
  final String role;
  final List<ChatPartsMessageModel> parts;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class ChatPartsMessageModel {
  ChatPartsMessageModel({required this.text});

  factory ChatPartsMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatPartsMessageModel(
      text: map['text'] as String,
    );
  }

  factory ChatPartsMessageModel.fromJson(String source) =>
      ChatPartsMessageModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
  final String text;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  String toJson() => json.encode(toMap());
}
