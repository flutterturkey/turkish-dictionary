import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayHelper {
  static SystemUiOverlayStyle statusBarBrightness(_isKeyboardVisible) {
    return SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: _isKeyboardVisible ? Brightness.dark : Brightness.light);
  }
}
