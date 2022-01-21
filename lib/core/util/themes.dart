import 'package:flutter/material.dart';

enum ThemeOptions {
  light,
  dark,
}

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 251, 246, .1),
  100: const Color.fromRGBO(255, 251, 246, .2),
  200: const Color.fromRGBO(255, 251, 246, .3),
  300: const Color.fromRGBO(255, 251, 246, .4),
  400: const Color.fromRGBO(255, 251, 246, .5),
  500: const Color.fromRGBO(255, 251, 246, .6),
  600: const Color.fromRGBO(255, 251, 246, .7),
  700: const Color.fromRGBO(255, 251, 246, .8),
  800: const Color.fromRGBO(255, 251, 246, .9),
  900: const Color.fromRGBO(255, 251, 246, 1),
};

MaterialColor lightPriSwatch = MaterialColor(0xFFFFFBF6, color);

final themeOptions = {
  ThemeOptions.light: ThemeData(
    brightness: Brightness.light,
    primarySwatch: lightPriSwatch,
    backgroundColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFFFFBF6),
    appBarTheme: const AppBarTheme(
      color: const Color(0xFFFFFBF6),
      elevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: lightPriSwatch).copyWith(
      secondary: Colors.black,
      brightness: Brightness.light,
    ),
  ),
  ThemeOptions.dark: ThemeData(
    brightness: Brightness.light,
    primarySwatch: lightPriSwatch,
    backgroundColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFFFFBF6),
    appBarTheme: const AppBarTheme(
      color: const Color(0xFFFFFBF6),
      elevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: lightPriSwatch).copyWith(
      secondary: Colors.black,
      brightness: Brightness.light,
    ),
  ),
};
