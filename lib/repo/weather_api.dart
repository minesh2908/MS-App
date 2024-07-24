import 'package:dio/dio.dart';
import 'package:minesh_app/model/weather_model.dart';
import 'package:minesh_app/utils/constants.dart';

class WeatherApi {
  static Future<WeatherModal> getWeatherDetails(String lat, String lon) async {
    print('Weather button clicked');
    try {
      final dio = Dio();
      final weatherResponse = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric',
      );
      // print(weatherResponse.data);
      return WeatherModal.fromJson(
        weatherResponse.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
