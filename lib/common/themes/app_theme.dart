import 'package:flutter/material.dart';
import 'package:newsapp/common/app_text_style.dart';
import 'package:newsapp/common/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    dividerColor: AppColors.pramiryWhite,
    dividerTheme: DividerThemeData(color: AppColors.pramiryWhite),
    scaffoldBackgroundColor: AppColors.pramiryWhite,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.pramiryWhite,
      primary: AppColors.pramiryWhite,
      secondary: AppColors.praimyBlack,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.styles16w500black,
      backgroundColor: AppColors.pramiryWhite,
      foregroundColor: AppColors.praimyBlack,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.stylew70022(color: AppColors.praimyBlack),
      displayMedium: AppTextStyle.stylew70020(color: AppColors.praimyBlack),
      displaySmall: AppTextStyle.stylew70018(color: AppColors.praimyBlack),

      headlineLarge: AppTextStyle.stylew60022(color: AppColors.praimyBlack),
      headlineMedium: AppTextStyle.stylew60020(color: AppColors.praimyBlack),
      headlineSmall: AppTextStyle.stylew60018(color: AppColors.praimyBlack),

      titleLarge: AppTextStyle.stylew50022(color: AppColors.praimyBlack),
      titleMedium: AppTextStyle.stylew50020(color: AppColors.praimyBlack),
      titleSmall: AppTextStyle.stylew50018(color: AppColors.praimyBlack),

      bodyLarge: AppTextStyle.stylew40022(color: AppColors.praimyBlack),
      bodyMedium: AppTextStyle.stylew40020(color: AppColors.praimyBlack),
      bodySmall: AppTextStyle.stylew40018(color: AppColors.praimyBlack),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    dividerColor: AppColors.pramiryWhite,
    dividerTheme: DividerThemeData(color: AppColors.pramiryWhite),
    scaffoldBackgroundColor: AppColors.praimyBlack,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.praimyBlack,
      brightness: Brightness.dark,
      primary: AppColors.praimyBlack,
      secondary: AppColors.pramiryWhite,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.styles20w500white,

      backgroundColor: AppColors.praimyBlack,
      foregroundColor: AppColors.pramiryWhite,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.stylew70022(color: AppColors.pramiryWhite),
      displayMedium: AppTextStyle.stylew70020(color: AppColors.pramiryWhite),
      displaySmall: AppTextStyle.stylew70018(color: AppColors.pramiryWhite),

      headlineLarge: AppTextStyle.stylew60022(color: AppColors.pramiryWhite),
      headlineMedium: AppTextStyle.stylew60020(color: AppColors.pramiryWhite),
      headlineSmall: AppTextStyle.stylew60018(color: AppColors.pramiryWhite),

      titleLarge: AppTextStyle.stylew50022(color: AppColors.pramiryWhite),
      titleMedium: AppTextStyle.stylew50020(color: AppColors.pramiryWhite),
      titleSmall: AppTextStyle.stylew50018(color: AppColors.pramiryWhite),

      bodyLarge: AppTextStyle.stylew40022(color: AppColors.pramiryWhite),
      bodyMedium: AppTextStyle.stylew40020(color: AppColors.pramiryWhite),
      bodySmall: AppTextStyle.stylew40018(color: AppColors.pramiryWhite),
    ),
  );
}
