import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'app_colors.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.beigeColor,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.redPinkMain,
    onPrimary: AppColors.milkWhite,
=======

import 'colors.dart';

final ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: AppColors.beigeColor,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.redPinkMain,
    onPrimary: Colors.white,
>>>>>>> origin/main
    secondary: AppColors.pink,
    onSecondary: AppColors.pinkSub,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColors.beigeColor,
    onSurface: Colors.white,
  ),
<<<<<<< HEAD
);

class AppThemes {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.redPinkMain,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    fontFamily: "Poppins",
    colorScheme: AppColors.lightColorScheme,
  );
}
=======
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.beigeColor,
    surfaceTintColor: Colors.transparent,
  ),
);
>>>>>>> origin/main
