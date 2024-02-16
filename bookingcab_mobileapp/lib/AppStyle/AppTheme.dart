
import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppTheme{

  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
        primaryColor: primaryColor,
        iconTheme: const IconThemeData(color: iconColor),
        primarySwatch: const MaterialColor(
          0xffF2EF21,
          <int, Color>{
            50:  primaryColor,
            100: primaryColor,
            200: primaryColor,
            300: primaryColor,
            400: primaryColor,
            500: primaryColor,
            600: primaryColor,
            700: primaryColor,
            800: primaryColor,
            900: primaryColor
          },
        ),
        //primaryColorLight: const Color(0x1aF5E0C3),
        primaryColorDark: primaryColor,
        canvasColor: primaryColor,
        scaffoldBackgroundColor: bodyBgColor,
        //cardColor: const Color(0xaaF5E0C3),
       // dividerColor: const Color(0x1f6D42CE),
       // focusColor: const Color(0x1aF5E0C3),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Roboto',
        bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff6D42CE)), //3
    );
  }  
}