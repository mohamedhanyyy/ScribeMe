import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:subcribe/shared/themes/palette.dart';

import '../../core/resources/colors.dart';
import '../../services/cache/cache_helper.dart';

class AppThemes {
  // Light Theme
  static ThemeData whiteTheme = ThemeData(
    fontFamily: CacheHelper.getLang == 'ar' ? 'Cairo' : 'Roboto',
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.whiteColor,
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 13.sp),
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
    ),
    highlightColor: Colors.transparent,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
    hoverColor: Colors.transparent,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Palette.kToDark,
    ).copyWith(surface: AppColors.whiteColor),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: CacheHelper.getLang == 'ar' ? 'Cairo' : 'Roboto',
    brightness: Brightness.dark,
    dividerTheme: const DividerThemeData(color: Colors.grey),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.blackColor, // Set your dark background color
    cardColor: AppColors.blackColor, // Set your dark card color
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 13.sp, color: AppColors.whiteColor),
      titleSpacing: 0,

      elevation: 0,
      backgroundColor: AppColors.blackColor,
    ),
    highlightColor: Colors.transparent,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
    hoverColor: Colors.transparent,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Palette.kToDark,
      brightness: Brightness.dark,
    ).copyWith(
      surface: AppColors.blackColor,
    ),
  );
}
