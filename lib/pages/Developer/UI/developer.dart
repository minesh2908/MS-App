import 'package:flutter/material.dart';
import 'package:minesh_app/pages/developer/ui/desktop_screen_developer.dart';
import 'package:minesh_app/pages/developer/ui/mobile_screen_developer.dart';
import 'package:minesh_app/responsive/responsive_layout.dart';

class DevloperPage extends StatelessWidget {
  const DevloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Developer',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const ResponsiveLayout(
        mobileBody: mobileScreenDeveloper(),
        tabletBody: mobileScreenDeveloper(),
        desktopBody: desktopScreenDeveloper(),
      ),
    );
  }
}
