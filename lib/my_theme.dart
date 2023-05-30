import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryLight = Color(0xff5D9CEC);
  static Color primarydark = Color(0xff060E1E);
  static Color greenLight = Color(0xffDFECDB);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff303030);
  static Color redColor = Color(0xffEC4B4B);
  static Color greenColor = Color(0xff61E757);


  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: greenLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: primaryLight,
      unselectedItemColor: Colors.grey,
    ),
floatingActionButtonTheme:FloatingActionButtonThemeData(
  shape:RoundedRectangleBorder(
    side: BorderSide(
      color: whiteColor,
      width: 4,
    ),
    borderRadius: BorderRadius.circular(30),
  ) ,
  backgroundColor: primaryLight,
) ,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      )
    )
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primarydark,
    scaffoldBackgroundColor: primarydark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: blackColor,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: primaryLight,
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme:FloatingActionButtonThemeData(
      shape:RoundedRectangleBorder(
        side: BorderSide(
          color: blackColor,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(30),
      ) ,
      backgroundColor: primaryLight,
    ) ,
      textTheme: TextTheme(
          subtitle1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
          headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: blackColor,
          )
      )
  );
}