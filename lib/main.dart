import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesh_app/theme/bloc/theme_bloc.dart';
import 'package:minesh_app/theme/theme/theme.dart';
import 'package:minesh_app/views/ai_chat/ui/ai_chat.dart';
import 'package:minesh_app/views/bottom/bottomNavBar.dart';
import 'package:minesh_app/views/dashboard/ui/dashboard.dart';
import 'package:minesh_app/views/developer/ui/developer.dart';
import 'package:minesh_app/views/helper/ui/helper.dart';
import 'package:minesh_app/views/qr/ui/qr_code_generation.dart';
import 'package:url_strategy/url_strategy.dart'; // Import url_strategy

void main() {
  // Call setPathUrlStrategy to use path URLs instead of hash URLs
  setPathUrlStrategy();
  runApp(const MyApp());
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
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const Dashboard(),
              '/aichat': (context) => const HomePage(),
              '/helper': (context) => const Helper(),
              '/qr': (context) => const QrCodeGenerator(),
              '/mineshsarawogi': (context) => const DevloperPage(),
            },
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
          );
        },
      ),
    );
  }
}
