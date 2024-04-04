import 'dart:convert';

class ChatMessageResponse {
  final List<Candidate>? candidates;
  final PromptFeedback? promptFeedback;

  ChatMessageResponse({
    this.candidates,
    this.promptFeedback,
  });

  ChatMessageResponse copyWith({
    List<Candidate>? candidates,
    PromptFeedback? promptFeedback,
  }) =>
      ChatMessageResponse(
        candidates: candidates ?? this.candidates,
        promptFeedback: promptFeedback ?? this.promptFeedback,
      );

  factory ChatMessageResponse.fromJson(String str) =>
      ChatMessageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatMessageResponse.fromMap(Map<String, dynamic> json) =>
      ChatMessageResponse(
        candidates: json["candidates"] == null
            ? []
            : List<Candidate>.from(
                json["candidates"]!.map((x) => Candidate.fromMap(x))),
        promptFeedback: json["promptFeedback"] == null
            ? null
            : PromptFeedback.fromMap(json["promptFeedback"]),
      );

  Map<String, dynamic> toMap() => {
        "candidates": candidates == null
            ? []
            : List<dynamic>.from(candidates!.map((x) => x.toMap())),
        "promptFeedback": promptFeedback?.toMap(),
      };
}

class Candidate {
  final Content? content;
  final String? finishReason;
  final int? index;
  final List<SafetyRating>? safetyRatings;

  Candidate({
    this.content,
    this.finishReason,
    this.index,
    this.safetyRatings,
  });

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

  factory Candidate.fromJson(String str) => Candidate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Candidate.fromMap(Map<String, dynamic> json) => Candidate(
        content:
            json["content"] == null ? null : Content.fromMap(json["content"]),
        finishReason: json["finishReason"],
        index: json["index"],
        safetyRatings: json["safetyRatings"] == null
            ? []
            : List<SafetyRating>.from(
                json["safetyRatings"]!.map((x) => SafetyRating.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "content": content?.toMap(),
        "finishReason": finishReason,
        "index": index,
        "safetyRatings": safetyRatings == null
            ? []
            : List<dynamic>.from(safetyRatings!.map((x) => x.toMap())),
      };
}

class Content {
  final List<Part>? parts;
  final String? role;

  Content({
    this.parts,
    this.role,
  });

  Content copyWith({
    List<Part>? parts,
    String? role,
  }) =>
      Content(
        parts: parts ?? this.parts,
        role: role ?? this.role,
      );

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        parts: json["parts"] == null
            ? []
            : List<Part>.from(json["parts"]!.map((x) => Part.fromMap(x))),
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "parts": parts == null
            ? []
            : List<dynamic>.from(parts!.map((x) => x.toMap())),
        "role": role,
      };
}

class Part {
  final String? text;

  Part({
    this.text,
  });

  Part copyWith({
    String? text,
  }) =>
      Part(
        text: text ?? this.text,
      );

  factory Part.fromJson(String str) => Part.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Part.fromMap(Map<String, dynamic> json) => Part(
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
      };
}

class SafetyRating {
  final String? category;
  final String? probability;

  SafetyRating({
    this.category,
    this.probability,
  });

  SafetyRating copyWith({
    String? category,
    String? probability,
  }) =>
      SafetyRating(
        category: category ?? this.category,
        probability: probability ?? this.probability,
      );

  factory SafetyRating.fromJson(String str) =>
      SafetyRating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SafetyRating.fromMap(Map<String, dynamic> json) => SafetyRating(
        category: json["category"],
        probability: json["probability"],
      );

  Map<String, dynamic> toMap() => {
        "category": category,
        "probability": probability,
      };
}

class PromptFeedback {
  final List<SafetyRating>? safetyRatings;

  PromptFeedback({
    this.safetyRatings,
  });

  PromptFeedback copyWith({
    List<SafetyRating>? safetyRatings,
  }) =>
      PromptFeedback(
        safetyRatings: safetyRatings ?? this.safetyRatings,
      );

  factory PromptFeedback.fromJson(String str) =>
      PromptFeedback.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PromptFeedback.fromMap(Map<String, dynamic> json) => PromptFeedback(
        safetyRatings: json["safetyRatings"] == null
            ? []
            : List<SafetyRating>.from(
                json["safetyRatings"]!.map((x) => SafetyRating.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "safetyRatings": safetyRatings == null
            ? []
            : List<dynamic>.from(safetyRatings!.map((x) => x.toMap())),
      };
}
