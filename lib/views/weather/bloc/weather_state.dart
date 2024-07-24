part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class LocationSuccessState extends WeatherState {
  LocationSuccessState({required this.currentPosition});

  Position currentPosition;
}

final class WeatherSuccessState extends WeatherState {
  WeatherSuccessState({required this.weatherData});

  final WeatherModal weatherData;
}

final class WeatherErrorState extends WeatherState {
  WeatherErrorState({required this.errorMessage});

  final String errorMessage;
}
