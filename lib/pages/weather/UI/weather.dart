import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:space_app/repo/weather-api.dart';
import 'package:space_app/utils/getlocation.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    // TODO: implement initState

    getLocation.determinePosition();
    super.initState();
    _currentPosition = Position(
      latitude: 0,
      longitude: 0,
      altitude: 0, // Adding default values for other parameters
      accuracy: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      altitudeAccuracy: 0,
      timestamp: DateTime.now(), headingAccuracy: 0,
    );
  }

  late Position _currentPosition;
  Future<void> getLotLong() async {
    print('clicked');
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
      print(position);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: getLotLong,
            child: const Text('Get Location'),
          ),
          Column(
            children: [
              Text('Latitude: ${_currentPosition.latitude}'),
              Text('Longitude: ${_currentPosition.longitude}'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              WeatherApi.getWeatherDetails(
                _currentPosition.longitude.toString(),
                _currentPosition.latitude.toString(),
              );
            },
            child: const Text('Get Weather'),
          ),
        ],
      ),
    );
  }
}
