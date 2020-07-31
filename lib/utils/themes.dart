import 'package:flutter/material.dart';
import 'package:ghar_ka_khaana/utils/constants.dart';
import 'package:ghar_ka_khaana/values/values.dart';

class AppTheme {
  static ThemeData get theme {
    Color primaryColor = Color.fromARGB(255, 255, 255, 255);
    Color primaryColorLight = Color.fromARGB(255, 243, 246, 254);
    Color backgroundColor = Color(0xff);
    Color scaffoldBackgroundColor = AppColors.scbkd1;
    Color bottomAppBarColor = Color(0xff);
    const Color primaryText = AppColors.sctxt;
    const Color appBarColor = Color(0xff071844);

    final originalTextTheme = ThemeData.light().textTheme;

    return ThemeData.light().copyWith(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
            color: appBarColor,
            iconTheme: IconThemeData(color: AppColors.white, size: 25.0),
            elevation: AppConstants.elevation,
            textTheme: originalTextTheme.copyWith(
                headline1: originalTextTheme.headline1.copyWith(
                    fontFamily: '',
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.sctxt))),
        primaryColorLight: primaryColorLight,
        accentColor: AppColors.blueShade1,
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        bottomAppBarColor: bottomAppBarColor,
        errorColor: Colors.red,
        splashColor: AppColors.whiteShade1,
        highlightColor: Colors.transparent,
        textTheme: originalTextTheme.copyWith(
            headline1: originalTextTheme.headline1.copyWith(
                fontFamily: '',
                // fontSize: ScreenUtil().setSp(19.0),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: primaryText),
            headline2: originalTextTheme.headline1.copyWith(
                fontFamily: '',
                // fontSize: ScreenUtil().setSp(15.0),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: primaryText),
            headline3: originalTextTheme.headline1.copyWith(
                fontFamily: '',
                // fontSize: ScreenUtil().setSp(14.0),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: primaryText),
            headline4: originalTextTheme.headline1.copyWith(
                fontFamily: '',
                // fontSize: ScreenUtil().setSp(13.0),
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: primaryText),
            headline5: originalTextTheme.headline1.copyWith(
                fontFamily: '',
                // fontSize: ScreenUtil().setSp(12.0),
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: primaryText),
            headline6: originalTextTheme.headline1.copyWith(
                fontFamily: '',
                // fontSize: ScreenUtil().setSp(11.0),
                fontSize: 11.0,
                fontWeight: FontWeight.w400,
                color: primaryText),
            button: originalTextTheme.button
                .copyWith(color: primaryColor, fontSize: 18.0)));
  }
}
