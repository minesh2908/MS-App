import 'package:dio/dio.dart';
import 'package:space_app/utils/constants.dart';

class WeatherApi {
  static getWeatherDetails(String lon, String lat) async {
    print('Weather button clicked');
    try {
      Dio dio = Dio();
      var weatherResponse = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherApiKey');
      print(weatherResponse);
    } catch (e) {
      print(e.toString());
    }
  }
}
