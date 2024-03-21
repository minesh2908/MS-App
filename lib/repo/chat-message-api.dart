import 'dart:math';

import 'package:dio/dio.dart';
import 'package:space_app/model/chat-message-request.dart';
import 'package:space_app/model/chat-message-response.dart';
import 'package:space_app/utils/constants.dart';

class ChatMessageApiCall {
  static chatTextGenerationApi(List<ChatMessageRequestModel> previousMessages) async {
    try {
      Dio dio = Dio();
      var response = await dio.post(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${api}',
          data: {
            "contents": previousMessages.map((e) => e.toMap()).toList(),
            "generationConfig": {
              "temperature": 0.9,
              "topK": 1,
              "topP": 1,
              "maxOutputTokens": 2048,
              "stopSequences": []
            },
            "safetySettings": [
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              }
            ]
          });
           
          if(response.statusCode!>=200 && response.statusCode!<300){
              //print(response.data['candidates'].first['content']['parts'].first['text']);
           //   return response.data['candidates'].first['content']['parts'].first['text'];
           print(response.data.runtimeType);
           final modal1 = ChatMessageResponse.fromMap(response.data);
           return modal1.candidates?.first.content?.parts?.first.text;
          }
      return '';
    } catch (e) {
      print(e.toString());
      return '';
    }
  }
}
