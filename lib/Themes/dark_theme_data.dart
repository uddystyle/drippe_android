import 'package:flutter/material.dart';

final ThemeData darkThemeData = ThemeData.from(
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    surface: Colors.black,
    secondary: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.bold),
  ),
  // useMaterial3: true,
).copyWith(
  toggleableActiveColor: Colors.white,
  unselectedWidgetColor: Colors.white.withOpacity(0.3),
);
