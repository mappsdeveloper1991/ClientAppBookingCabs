import 'dart:ui';

import 'package:flutter/material.dart';
import 'AppColors.dart';

TextStyle textFormFieldStyle() {
  return const TextStyle(
    fontSize: 18,
    color: blackColor,
  );
}

InputDecoration textFormFieldDecoration(BuildContext context, String labelText, IconData iconData){
  return InputDecoration(
    labelStyle: const TextStyle(
      color: lighGray2,
      fontSize: 18,
      //fontWeight: FontWeight.bold,
    ),
    border: const UnderlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: primaryColor,
      ), //<-- SEE HERE
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: const OutlineInputBorder(
      //<-- SEE HERE
      borderSide: BorderSide(width: 1, color: blackColor),
    ),
    prefixIcon:  Icon( iconData,
      color: blackColor,
    ),
    labelText:  labelText,
    hintText: labelText,
    hintStyle: TextStyle(fontSize: 16.0, color: lighGray2),
  );
}


TextStyle buttonTextStyle(BuildContext context, Color color, double fontSize){
  return  TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    color: color,
    letterSpacing: 1.5,
  );
}