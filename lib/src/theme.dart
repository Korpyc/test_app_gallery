import 'package:flutter/material.dart';
import 'values.dart';

ThemeData primeTheme() => ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: appBarTextSize,
          color: appBarTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: bodyTextSize,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )));
