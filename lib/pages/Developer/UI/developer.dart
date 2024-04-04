import 'package:flutter/material.dart';
import 'package:space_app/pages/Developer/UI/desktopScreenDeveloper.dart';
import 'package:space_app/pages/Developer/UI/mobileScreenDeveloper.dart';
import 'package:space_app/responsive/responsive_layout.dart';

class DevloperPage extends StatelessWidget {
  const DevloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        title: Text(
          'Developer',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold),
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
