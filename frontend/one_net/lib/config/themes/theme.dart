import 'package:flutter/material.dart';
part 'app_icons.dart';
part 'color.dart';
part 'text_styles.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.white,
    primaryColor: AppColor.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0,
    ),
    bottomAppBarTheme: ThemeData.light().bottomAppBarTheme.copyWith(
          color: Colors.white,
          elevation: 0,
        ),
  );
}