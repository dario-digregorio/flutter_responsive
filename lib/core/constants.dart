import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  final double size;

  const ScreenSize(this.size);
}

class ScreenUtils {
  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

  static bool isBigDevice(ScreenSize screenSize) =>
      screenSize == ScreenSize.large || screenSize == ScreenSize.extraLarge;

  static ScreenSize getScreenSize(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
    if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
    if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
    if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
    return ScreenSize.small;
  }
}

class Spacing {
  static const double x0 = 0;
  static const double x1 = 2;
  static const double x2 = 4;
  static const double x3 = 8;
  static const double x4 = 16;
  static const double x5 = 32;
}
