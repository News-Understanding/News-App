import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.orange,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue, // Icon button color
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    hintColor: Colors.red,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black, // Icon button color for dark theme
    ),
  );
}
