import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  primarySwatch: Colors.pink,
  canvasColor: Colors.white,
  hintColor: const Color(-221459766),
  shadowColor: Colors.grey,
  cardColor: Colors.blue,
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 40.0,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 52.0,
      color: Colors.black,
    ),

  ),
);
var darkTheme = ThemeData(
  primarySwatch: Colors.pink,
  canvasColor: Colors.black,
  hintColor:const Color(-737991866),
  shadowColor: Colors.grey,
  cardColor: Colors.blue,
  // primaryColor: const Color(-737991866),
  // canvasColor: const Color(-738062562),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 52.0,
      color: Colors.white,
    ),
  ),
);
