import 'dart:async';
import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class getLocation {
  static Future<void> checkPermission() async {
    print('Location function called');
    final status = await Permission.location.request();
    if (status.isGranted) {
      log('Permission granted');
    } else {
      log('Permission Denied');
    }
  }
}
