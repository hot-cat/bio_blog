import 'package:flutter/material.dart';

var appTheme = ThemeData(
  // useMaterial3: true, //Material 3
  // colorSchemeSeed: Colors.black,
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.white,
    secondary: AppColors.purple,

    // or from RGB
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.black)),
);

class AppColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color purple = Color(0xFFCABCF5);
  static const Color green = Color(0xFFEDF860);
}
