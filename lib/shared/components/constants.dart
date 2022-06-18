//GET
// https://newsapi.org/
// v2/top-headlines?
// country=Eg&
// category=sport
// apiKey=0050acf6be8344e2afa73273ca324a9b

//GET
// https://newsapi.org/
// v2/everything?
// q=bitcoin&
// apiKey=0050acf6be8344e2afa73273ca324a9b

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData themeDark = ThemeData(

    scaffoldBackgroundColor: HexColor('2d2d2d'),
    primarySwatch: Colors.green,
    textTheme:  TextTheme(
        bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),bodyText2: TextStyle(color: Colors.grey[300],
    fontSize: 15)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: HexColor('ff8c00'),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('2d2d2d'),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor('ff8c00'),
// backgroundColor: HexColor('ff8c00'),
      unselectedItemColor: HexColor('cfc4b8'),
    ),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: HexColor('FFFFFF'),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: HexColor('2d2d2d'),
        elevation: 0,
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('2d2d2d'),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light)));

ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    textTheme:   TextTheme(
        bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),bodyText2: TextStyle(color: Colors.grey,
        fontSize: 15)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: HexColor('ff8c00'),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor('ff8c00'),
      // backgroundColor: HexColor('ff8c00'),
      unselectedItemColor: HexColor('cfc4b8'),
    ),
    appBarTheme: AppBarTheme(
        iconTheme:const IconThemeData(color: Colors.black),
        titleTextStyle:const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: HexColor('ffffff'),
        elevation: 0,
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('ffffff'),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark)));
