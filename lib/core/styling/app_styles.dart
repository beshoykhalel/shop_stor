import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_fonts.dart';

class AppStyles {
  static TextStyle primaryHeadLinesStyle = TextStyle(
      fontFamily: AppFonts.mainFontName,
      color: AppColors.primaryColor,
      fontSize: 30.sp,
      fontWeight: FontWeight.bold);
  static TextStyle secondaryPrimaryHeadLinesStyle = TextStyle(
      fontFamily: AppFonts.mainFontName,
      color: AppColors.balckColor,
      fontSize: 30.sp,
      fontWeight: FontWeight.bold);
  static TextStyle subtitlesStyles = TextStyle(
      fontFamily: AppFonts.mainFontName,
      color: AppColors.scondryColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static TextStyle black16w500style = TextStyle(
      fontFamily: AppFonts.mainFontName,
      color: AppColors.balckColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static TextStyle graymediumstyle = TextStyle(
      fontFamily: AppFonts.mainFontName,
      color: AppColors.scondryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static TextStyle black15BoldStyle = TextStyle(
      fontFamily: AppFonts.mainFontName,
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold);
}
