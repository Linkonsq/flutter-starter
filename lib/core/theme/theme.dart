import 'package:flutter/material.dart';
import 'package:flutter_starter/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppPalette.backgroundColor),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(AppPalette.backgroundColor),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.gradient2),
    ),
  );
}
