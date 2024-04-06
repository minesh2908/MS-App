part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetCurrentWeatherDataEvent extends WeatherEvent {}

class RetryGetPermissionEvent extends WeatherEvent {}
