import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/theme/theme_color.dart';


// All text style based on design guideline
class ThemeText {
  // Default Text Style Following Guideline
  static final headline1 =
      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold);
  static final headline2 =
      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.normal);
  static final headline3 =
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal);
  static final headline4 =
      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.normal);
  static final headline5 =
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.normal);
  static final headline6 =
      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal);
  static final bodyText2 =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal);
  static final TextStyle bodyText1 =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static final TextStyle subtitle1 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal);
  static final TextStyle subtitle2 =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal);
  static final caption =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal);

  static TextTheme getDefaultTextTheme() => TextTheme(
        headline1: ThemeText.headline1,
        headline2: ThemeText.headline2,
        headline3: ThemeText.headline3,
        headline4: ThemeText.headline4,
        headline5: ThemeText.headline5,
        headline6: ThemeText.headline6,
        bodyText2: ThemeText.bodyText2,
        bodyText1: ThemeText.bodyText1,
        subtitle1: ThemeText.subtitle1,
        subtitle2: ThemeText.subtitle2,
        caption: ThemeText.caption,
      );
}

extension CustomTextTheme on TextTheme {
  TextStyle get title =>
      subtitle1?.copyWith(
        color: AppColor.lightGrey,
      ) ??
      ThemeText.subtitle1;

  TextStyle get subTitle =>
      caption?.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColor.grey,
      ) ??
      ThemeText.caption;

  TextStyle get headlineTitle =>
      headline2?.copyWith(
          color: AppColor.white,
          letterSpacing: 3,
          fontSize: 29.sp) ??
      ThemeText.headline2;

  TextStyle get description =>
      subtitle2?.copyWith(color: AppColor.grey) ??
      ThemeText.subtitle2;
}
