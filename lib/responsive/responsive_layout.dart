import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobileBody,
    required this.desktopBody,
    required this.tabletBody,
    super.key,
  });
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1160) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
