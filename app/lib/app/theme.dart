import 'package:flutter/material.dart';

class Colours {
  static const primary = Colors.white;
  static const backgroundDark = Color(0xff130233);
  static const backgroundLight = Color(0xff1a0541);
  static const accent = Color(0xffac42fe);
}

final mainTheme = ThemeData(
  backgroundColor: Colours.backgroundDark,
  scaffoldBackgroundColor: Colours.backgroundDark,
  fontFamily: 'DPClear',
  primaryColor: Colours.primary,
  colorScheme: const ColorScheme(
    background: Colours.backgroundDark,
    onBackground: Colours.primary,
    brightness: Brightness.dark,
    primary: Colours.primary,
    onPrimary: Colours.accent,
    secondary: Colours.primary,
    onSecondary: Colours.accent,
    error: Colors.red,
    onError: Colors.black87,
    surface: Colours.backgroundLight,
    onSurface: Colours.primary,
  ),
  // textTheme: const TextTheme(
  //   headline1: TextStyle(color: Colours.primary),
  //   bodyText1: TextStyle(color: Colours.primary),
  //   bodyText2: TextStyle(color: Colours.primary),
  //   headline6: TextStyle(color: Colours.primary),
  //   subtitle1: TextStyle(color: Colours.primary),
  //   subtitle2: TextStyle(color: Colours.primary),
  //   caption: TextStyle(color: Colours.primary),
  // ),
);
