import 'package:flutter/material.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/core/theme/app_text_size.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: AppColor.borderColor,
      blurRadius: 10,
      spreadRadius: 16,
      offset: const Offset(0, 3),
    ),
  ];

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColor.primaryColor,
      elevation: 10,
      iconTheme: IconThemeData(color: AppColor.primaryTextColor),
      titleTextStyle: TextStyle(
        color: AppColor.whiteColor,
        fontSize: AppTextSize.titleLarge,
        fontWeight: FontWeight.w500,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
    cardColor: AppColor.cardColor,
    dividerColor: AppColor.borderColor,
    hintColor: AppColor.secondaryTextColor,
    canvasColor: AppColor.primaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
    ),
    iconTheme: IconThemeData(
        color: AppColor.iconColor, size: 25, opacity: 1, grade: 10),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: AppColor.primaryTextColor,
        fontSize: AppTextSize.bodySmall,
      ),
      bodyMedium: TextStyle(
          color: AppColor.primaryColor, fontSize: AppTextSize.bodyMedium),
      bodyLarge: TextStyle(
        color: AppColor.primaryColor,
        fontSize: AppTextSize.bodyLarge,
      ),
      titleSmall: TextStyle(
          color: AppColor.primaryTextColor,
          fontSize: AppTextSize.titleSmall,
          fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
          color: AppColor.primaryTextColor,
          fontSize: AppTextSize.titleMedium,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: AppColor.primaryTextColor,
          fontSize: AppTextSize.titleLarge,
          fontWeight: FontWeight.w500),
    ),
  );

  static BorderRadius borderRadius = BorderRadius.circular(45);
}
