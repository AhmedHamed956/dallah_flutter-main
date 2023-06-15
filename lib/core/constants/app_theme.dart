import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_family.dart';

final ThemeData themeData = new ThemeData(
  fontFamily: FontFamily.bein,
  brightness: Brightness.light,
  backgroundColor: AppColors.lightColor,
  appBarTheme: AppBarTheme(color: Colors.white, iconTheme: IconThemeData(color: Colors.grey)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.secondaryColor,
    selectionHandleColor: AppColors.secondaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.white, backgroundColor: AppColors.primaryColor,shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))) ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorMaxLines: 3,
      errorStyle: TextStyle(fontSize: 12),
      contentPadding: EdgeInsets.symmetric(vertical: 10)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: AppColors.buttonColor,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        minimumSize: Size(250, 50)),
  ),
);
