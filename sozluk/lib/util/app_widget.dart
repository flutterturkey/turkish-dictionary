import 'package:flutter/material.dart';
import 'package:sozluk/util/app_constant.dart';

class AppWidget {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppConstant.colorPrimary,
      //accentColor: Colors.black,
      //toggleableActiveColor: Colors.black,
      //hintColor: Colors.black,

      backgroundColor: AppConstant.colorPageBg,

      textTheme: TextTheme(
        display1: TextStyle(
            fontSize: AppConstant.fontSizeDisplay, fontWeight: FontWeight.bold),
        headline: TextStyle(
            fontSize: AppConstant.fontSizeHeadline,
            fontWeight: FontWeight.bold),
        title: TextStyle(
            fontSize: AppConstant.fontSizeTitle, fontWeight: FontWeight.bold),
        body1: TextStyle(fontSize: AppConstant.fontSizeBody),
        body2: TextStyle(
            fontSize: AppConstant.fontSizeBody2, fontWeight: FontWeight.bold),
        caption: TextStyle(
            fontSize: AppConstant.fontSizeCaption, fontWeight: FontWeight.bold),
      ),
      appBarTheme: AppBarTheme(brightness: Brightness.light),
    );
  }

  static Widget getSearchBox() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ara',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
