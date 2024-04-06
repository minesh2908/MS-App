import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:space_app/model/weather_model.dart';
import 'package:space_app/repo/weather_api.dart';
import 'package:universal_html/html.dart' as html;

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetCurrentWeatherDataEvent>(getCurrentWeatherDataEvent);
    on<RetryGetPermissionEvent>(retryGetPermissionEvent);
  }

  FutureOr<void> getCurrentWeatherDataEvent(
    GetCurrentWeatherDataEvent event,
    Emitter<WeatherState> emit,
  ) async {
    late Position currentPositon;
    log('get current function called');
    emit(WeatherLoadingState());

    if (await Permission.location.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        currentPositon = position;
        log(currentPositon.toString());
      } catch (e) {
        emit(WeatherErrorState(errorMessage: e.toString()));
      }
      //Location Fetched succesfully

      try {
        final weatherData = await WeatherApi.getWeatherDetails(
          currentPositon.latitude.toString(),
          currentPositon.longitude.toString(),
        );

        emit(WeatherSuccessState(weatherData: weatherData));
      } catch (e) {
        emit(WeatherErrorState(errorMessage: e.toString()));
      }
    } else {
      emit(
        WeatherErrorState(
          errorMessage: 'Location permission is not granted',
        ),
      );
    }
  }

  FutureOr<void> retryGetPermissionEvent(
    RetryGetPermissionEvent event,
    Emitter<WeatherState> emit,
  ) async {
    log('retry function called');
    emit(WeatherLoadingState());

    final permission = await Permission.location.request();
    log(permission.toString());
    if (permission.isGranted) {
      add(GetCurrentWeatherDataEvent());
    } else if (permission.isDenied) {
      emit(
        WeatherErrorState(
          errorMessage:
              'Location permission is required for fetching temperature',
        ),
      );
    } else if (permission.isPermanentlyDenied) {
      if (kIsWeb) {
        html.window.open('chrome://settings/', 'chrome_settings');
        emit(
          WeatherErrorState(
            errorMessage:
                'Location permission is required for fetching temperature',
          ),
        );
      } else {
        await openAppSettings();
        emit(
          WeatherErrorState(
            errorMessage:
                'Location permission is required for fetching temperature',
          ),
        );
      }
    }
  }
}
