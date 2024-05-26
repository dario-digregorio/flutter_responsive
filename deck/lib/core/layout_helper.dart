import 'package:flutter/material.dart';
import 'package:flutter_responsive/core/constants.dart';

// To not use MediaQuery.of(context) in the layout, we use this to get the screen size from a widget with constraints
ScreenSize getScreenSize(BoxConstraints constraints) {
  double deviceWidth = constraints.maxWidth;
  double deviceHeight = constraints.maxHeight;
  if (deviceWidth > ScreenSize.extraLarge.size &&
      deviceHeight > ScreenSize.extraLarge.size) {
    return ScreenSize.extraLarge;
  }
  if (deviceWidth > ScreenSize.large.size &&
      deviceHeight > ScreenSize.large.size) {
    return ScreenSize.large;
  }
  if (deviceWidth > ScreenSize.normal.size &&
      deviceHeight > ScreenSize.normal.size) {
    return ScreenSize.normal;
  }
  return ScreenSize.small;
}
