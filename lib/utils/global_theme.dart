
import 'package:flutter/material.dart';

ThemeData globalTheme()=> ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.white,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
  ).copyWith(
    secondary: Colors.green,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0,fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 12.0,fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0,fontFamily: 'Hind'),

  ),


);