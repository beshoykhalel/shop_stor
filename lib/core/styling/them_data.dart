import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_fonts.dart';
import 'package:shop_stor/core/styling/app_styles.dart';

class AppThemes {
  static final lightThem = ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: GoTransitions.slide.toRight.withFade,
          TargetPlatform.iOS: GoTransitions.slide.toRight.withFade,
          TargetPlatform.macOS: GoTransitions.slide.toRight.withFade,
        },
      ),
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
