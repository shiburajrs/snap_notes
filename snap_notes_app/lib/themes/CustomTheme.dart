import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      hintColor: Colors.orange,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      hintColor: Colors.deepOrange,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
      ),
    );
  }
}