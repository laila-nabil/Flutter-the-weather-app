import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';

var theme = ThemeData(
    primaryTextTheme: Typography().white,
    textTheme: Typography().white,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundDarkColor,
        foregroundColor: AppColors.white
    )
);
