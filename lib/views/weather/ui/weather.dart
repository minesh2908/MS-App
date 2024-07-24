// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:space_app/model/weather_model.dart';
// import 'package:space_app/pages/weather/bloc/weather_bloc.dart';
// import 'package:space_app/utils/getlocation.dart';

// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});

//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   @override
//   void initState() {
//     // `TODO`: implement initState

//     getLocation.checkPermission();
//     super.initState();
//   }

//   late WeatherModal weatherData;

//   WeatherBloc weatherBloc = WeatherBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BlocBuilder<WeatherBloc, WeatherState>(
//             bloc: weatherBloc,
//             builder: (context, state) {
//               switch (state.runtimeType) {
//                 case WeatherInitial:
//                   return ElevatedButton(
//                     onPressed: () {
//                       print('object');
//                       weatherBloc.add(getCurrentWeatherDataEvent());
//                       print(state.runtimeType);
//                     },
//                     child: const Text('Get Location and Weather'),
//                   );
//                 case WeatherSuccessState:
//                   if (state is WeatherSuccessState) {
//                     weatherData = state.weatherData;
//                   }
//                   return Column(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           print('object');
//                           weatherBloc.add(getCurrentLocationDataEvent());
//                           print(state.runtimeType);
//                         },
//                         child: const Text('Get Location and Weather'),
//                       ),
//                       Text(weatherData.weather![0].description.toString()),
//                       Text(weatherData.main!.temp.toString()),
//                       Image(
//                         image: NetworkImage(
//                           'https://openweathermap.org/img/wn/${weatherData.weather![0].icon}@4x.png',
//                         ),
//                       ),
//                     ],
//                   );
//                 default:
//                   return const Text('data');
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
