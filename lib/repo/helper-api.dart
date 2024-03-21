import 'package:dio/dio.dart';
import 'package:space_app/model/chat-message-response.dart';
import 'package:space_app/model/helper.dart';
import 'package:space_app/utils/constants.dart';

class HelperApi {
  static HelperGenerationApi(List<HelperModel> message) async {
    Dio dio = Dio();

    try {
      var response = await dio.post(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${api}',
          data: {
            "contents": message.map((e) => e.toMap()).toList(),
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
      print(response
            .data['candidates'].first['content']['parts'].first['text']);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //print(response.data['candidates'].first['content']['parts'].first['text']);
        // return response
        //     .data['candidates'].first['content']['parts'].first['text'];
         final modal1 = ChatMessageResponse.fromMap(response.data);
           return modal1.candidates?.first.content?.parts?.first.text;
      }
    } catch (e) {
      print(e);
    }
  }
}
