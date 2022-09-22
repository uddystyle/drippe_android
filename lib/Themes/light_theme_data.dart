import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData.from(
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Colors.black,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.bold),
  ),
  // useMaterial3: true,
).copyWith(
  toggleableActiveColor: Colors.black,
  unselectedWidgetColor: Colors.black.withOpacity(0.3),
);
