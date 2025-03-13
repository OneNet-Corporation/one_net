import 'package:flutter/material.dart';

class Responsive {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double responsiveWidth(BuildContext context, double baseWidth) {
    return baseWidth *
        screenWidth(context) /
        390; // Adjust based on a base width
  }

  static double responsiveHeight(BuildContext context, double baseHeight) {
    return baseHeight *
        screenHeight(context) /
        844; // Adjust based on a base height
  }

  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    return baseFontSize *
        screenWidth(context) /
        390; // Font size relative to screen width
  }
}
