import 'dart:convert';

class ChatMessageResponse {
  ChatMessageResponse({
    this.candidates,
    this.promptFeedback,
  });

  factory ChatMessageResponse.fromJson(String str) =>
      ChatMessageResponse.fromMap(json.decode(str) as Map<String, dynamic>);

  factory ChatMessageResponse.fromMap(Map<String, dynamic> json) =>
      ChatMessageResponse(
        candidates: json['candidates'] == null
            ? []
            : (json['candidates'] as List<dynamic>)
                .map(
                  (candidateJson) =>
                      Candidate.fromMap(candidateJson as Map<String, dynamic>),
                )
                .toList(),
        promptFeedback: json['promptFeedback'] == null
            ? null
            : PromptFeedback.fromMap(
                json['promptFeedback'] as Map<String, dynamic>,
              ),
      );
  final List<Candidate>? candidates;
  final PromptFeedback? promptFeedback;

  ChatMessageResponse copyWith({
    List<Candidate>? candidates,
    PromptFeedback? promptFeedback,
  }) =>
      ChatMessageResponse(
        candidates: candidates ?? this.candidates,
        promptFeedback: promptFeedback ?? this.promptFeedback,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'candidates': candidates == null
            ? []
            : List<dynamic>.from(candidates!.map((x) => x.toMap())),
        'promptFeedback': promptFeedback?.toMap(),
      };
}

class Candidate {
  Candidate({
    this.content,
    this.finishReason,
    this.index,
    this.safetyRatings,
  });

  factory Candidate.fromJson(String str) =>
      Candidate.fromMap(json.decode(str) as Map<String, dynamic>);

  factory Candidate.fromMap(Map<String, dynamic> json) => Candidate(
        content: json['content'] == null
            ? null
            : Content.fromMap(json['content'] as Map<String, dynamic>),
        finishReason: json['finishReason'] as String?,
        index: json['index'] as int?,
        safetyRatings: json['safetyRatings'] == null
            ? []
            : (json['safetyRatings'] as List<dynamic>)
                .map(
                  (ratingJson) =>
                      SafetyRating.fromMap(ratingJson as Map<String, dynamic>),
                )
                .toList(),
      );
  final Content? content;
  final String? finishReason;
  final int? index;
  final List<SafetyRating>? safetyRatings;

  Candidate copyWith({
    Content? content,
    String? finishReason,
    int? index,
    List<SafetyRating>? safetyRatings,
  }) =>
      Candidate(
        content: content ?? this.content,
        finishReason: finishReason ?? this.finishReason,
        index: index ?? this.index,
        safetyRatings: safetyRatings ?? this.safetyRatings,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'content': content?.toMap(),
        'finishReason': finishReason,
        'index': index,
        'safetyRatings': safetyRatings == null
            ? []
            : List<dynamic>.from(safetyRatings!.map((x) => x.toMap())),
      };
}

class Content {
  Content({
    this.parts,
    this.role,
  });

  factory Content.fromJson(String str) =>
      Content.fromMap(json.decode(str) as Map<String, dynamic>);

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        parts: json['parts'] == null
            ? []
            : (json['parts'] as List<dynamic>)
                .map(
                  (partJson) => Part.fromMap(partJson as Map<String, dynamic>),
                )
                .toList(),
        role: json['role'] as String?,
      );
  final List<Part>? parts;
  final String? role;

  Content copyWith({
    List<Part>? parts,
    String? role,
  }) =>
      Content(
        parts: parts ?? this.parts,
        role: role ?? this.role,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'parts': parts == null
            ? []
            : List<dynamic>.from(parts!.map((x) => x.toMap())),
        'role': role,
      };
}

class Part {
  Part({
    this.text,
  });

  factory Part.fromJson(String str) =>
      Part.fromMap(json.decode(str) as Map<String, dynamic>);

  factory Part.fromMap(Map<String, dynamic> json) => Part(
        text: json['text'] as String?,
      );
  final String? text;

  Part copyWith({
    String? text,
  }) =>
      Part(
        text: text ?? this.text,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'text': text,
      };
}

class SafetyRating {
  SafetyRating({
    this.category,
    this.probability,
  });

  factory SafetyRating.fromJson(String str) =>
      SafetyRating.fromMap(json.decode(str) as Map<String, dynamic>);

  factory SafetyRating.fromMap(Map<String, dynamic> json) => SafetyRating(
        category: json['category'] as String?,
        probability: json['probability'] as String?,
      );
  final String? category;
  final String? probability;

  SafetyRating copyWith({
    String? category,
    String? probability,
  }) =>
      SafetyRating(
        category: category ?? this.category,
        probability: probability ?? this.probability,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'category': category,
        'probability': probability,
      };
}

class PromptFeedback {
  PromptFeedback({
    this.safetyRatings,
  });

  factory PromptFeedback.fromJson(String str) =>
      PromptFeedback.fromMap(json.decode(str) as Map<String, dynamic>);

  factory PromptFeedback.fromMap(Map<String, dynamic> json) => PromptFeedback(
        safetyRatings: json['safetyRatings'] == null
            ? []
            : (json['safetyRatings'] as List<dynamic>)
                .map(
                  (ratingJson) =>
                      SafetyRating.fromMap(ratingJson as Map<String, dynamic>),
                )
                .toList(),
      );
  final List<SafetyRating>? safetyRatings;

  PromptFeedback copyWith({
    List<SafetyRating>? safetyRatings,
  }) =>
      PromptFeedback(
        safetyRatings: safetyRatings ?? this.safetyRatings,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'safetyRatings': safetyRatings == null
            ? []
            : List<dynamic>.from(safetyRatings!.map((x) => x.toMap())),
      };
}
