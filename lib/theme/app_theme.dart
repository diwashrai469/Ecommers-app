import 'package:flutter/material.dart';

class AppTheme {
  // for light theme
  final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.amber,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black, //color for counter and back button
        titleTextStyle: TextStyle(
            // app title text
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.black),
    ),
  );

  //for dark theme
  final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Colors.white),),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
        centerTitle: true, color: Colors.transparent, elevation: 0),
    brightness: Brightness.dark,
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.black),
    ),
  );
}
