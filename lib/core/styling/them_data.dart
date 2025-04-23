import 'package:flutter/material.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_fonts.dart';
import 'package:shop_stor/core/styling/app_styles.dart';

class AppThemes {
  static final lightThem = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      fontFamily: AppFonts.mainFontName,
      textTheme: TextTheme(
        titleLarge: AppStyles.primaryHeadLinesStyle,
        titleMedium: AppStyles.subtitlesStyles,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        disabledColor: AppColors.scondryColor,
      ));
}
