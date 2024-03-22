import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Theme/Theme/theme.dart';
import 'package:space_app/Theme/bloc/theme_bloc.dart';
import 'package:space_app/pages/Dashboard/UI/dashboard.dart';
import 'package:space_app/pages/AIchat/UI/AIchat.dart';
import 'package:space_app/pages/Helper/UI/helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            home: Dashboard(),
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
          );
        },
      ),
    );
  }
}
