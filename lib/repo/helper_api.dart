import 'package:dio/dio.dart';
import 'package:minesh_app/model/chat_message_response.dart';
import 'package:minesh_app/model/helper.dart';
import 'package:minesh_app/utils/constants.dart';

class HelperApi {
  static Future<String?>? HelperGenerationApi(List<HelperModel> message) async {
    final dio = Dio();

    try {
      final response = await dio.post(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=$geminiApiKey',
        data: {
          'contents': message.map((e) => e.toMap()).toList(),
          'generationConfig': {
            'temperature': 0.9,
            'topK': 1,
            'topP': 1,
            'maxOutputTokens': 2048,
            'stopSequences': [],
          },
          'safetySettings': [
            {
              'category': 'HARM_CATEGORY_HARASSMENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
            },
            {
              'category': 'HARM_CATEGORY_HATE_SPEECH',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
            },
            {
              'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
            },
            {
              'category': 'HARM_CATEGORY_DANGEROUS_CONTENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
            }
          ],
        },
      );
      print(
        response.data['candidates'].first['content']['parts'].first['text'],
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //print(response.data['candidates'].first['content']['parts'].first['text']);
        // return response
        //     .data['candidates'].first['content']['parts'].first['text'];
        final modal1 =
            ChatMessageResponse.fromMap(response.data as Map<String, dynamic>);
        return modal1.candidates?.first.content?.parts?.first.text;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
