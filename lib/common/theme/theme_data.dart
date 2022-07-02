import 'package:flutter/material.dart';
import 'theme_color.dart';
import 'theme_text.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'RobotoSlab',
    primaryColor: AppColor.primaryColor,
    textTheme: ThemeText.getDefaultTextTheme(),
    buttonTheme: ButtonThemeData(
      //update and enhance in screens where necessary
      buttonColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: const AppBarTheme(color: AppColor.white, elevation: 0.0),
    toggleableActiveColor: AppColor.primaryColor,
  );
}
