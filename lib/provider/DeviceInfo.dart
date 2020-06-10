import 'package:flutter/material.dart';

class DeviceInfo with ChangeNotifier {
  static String _androidId;

  static void setDeviceInfo(String androidId) async {
    _androidId = androidId;
  }

  static getAndroidId() {
    return _androidId;
  }
}
