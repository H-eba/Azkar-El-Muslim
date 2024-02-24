import 'package:flutter/material.dart';

class MyTemeData{
  static bool isDarkEnabled=false;
  static String fontMeesiri='messiri';
  static const primaryLight=Color(0xFFB7935F);
  static const primarydark=Color(0xFF141A2E);
  static final ThemeData light=ThemeData(
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(backgroundColor: Color(0xFFB7935F),
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 30)),

    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        centerTitle: true),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFB7935F),
    ),
    useMaterial3: true,
    primaryColor:primaryLight,
  );
  static final ThemeData dark=ThemeData(
    textTheme:  TextTheme(
       titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontFamily:fontMeesiri,
      fontWeight: FontWeight.w700,
    ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily:fontMeesiri,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily:fontMeesiri,
        fontWeight: FontWeight.w400,
      ),
    ),

    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(backgroundColor: Color(0xFFB7935F),
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFFFACC1D),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 30)),

    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFACC1D)),
        centerTitle: true),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF141A2E),
    ),
    useMaterial3: true,
    primaryColor:primarydark,
  );

  static getMainBackGround(){
    return MyTemeData.isDarkEnabled?
        'assets/images/dark_bg.png':
    'assets/images/default_bg.png';
  }
}