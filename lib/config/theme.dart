import 'package:flutter/material.dart';
import './constants.dart';

ThemeData themeData() {
  return ThemeData(
      fontFamily: 'Muli',
      textTheme: textTheme(),
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: kPrimaryColor,
      );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(width: 1.5),
      gapPadding: 10);
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    gapPadding: 10,
    borderSide: BorderSide(
      color: Colors.red,
      width: 1.2,
    ),
    borderRadius: BorderRadius.circular(28),
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    prefixStyle: TextStyle(),
    errorBorder: errorInputBorder,
    focusedErrorBorder: errorInputBorder
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      elevation: 0,
      color: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: kTextTheme,
      ),
      textTheme: TextTheme(
          headline6: TextStyle(
              color: kTextTheme, fontSize: 20, fontWeight: FontWeight.bold)));
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}
