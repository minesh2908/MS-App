import 'package:dio/dio.dart';
import 'package:space_app/model/weather-model.dart';
import 'package:space_app/utils/constants.dart';

class WeatherApi {
  static getWeatherDetails(String lon, String lat) async {
    print('Weather button clicked');
    try {
      final dio = Dio();
      final weatherResponse = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherApiKey',
      );
      print(weatherResponse.data.runtimeType);
    return WeatherModal.fromJson(weatherResponse.data as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
  }
}
