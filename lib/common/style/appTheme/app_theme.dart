import 'package:flutter/material.dart';

import '../colorPalette/color_palette.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    // accentColorBrightness: Brightness.dark,
    // primaryColorBrightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorPalette.light.primary),
    primaryColor: ColorPalette.light.primary,
    splashColor: ColorPalette.light.splash,
    highlightColor: Colors.transparent,
    // backgroundColor: ColorPalette.light.background,
    canvasColor: ColorPalette.light.background,
    scaffoldBackgroundColor: ColorPalette.light.scaffoldBackground,
    // buttonColor: ColorPalette.light.primary,
    // errorColor: ColorPalette.light.error,
    dividerColor: ColorPalette.light.divider,
    // toggleableActiveColor: ColorPalette.light.primary,
    shadowColor: ColorPalette.light.shadow,
    hintColor: ColorPalette.light.textSecondary,
    disabledColor: ColorPalette.light.disabled,
    primaryColorDark: ColorPalette.light.primary.dark,
    primaryColorLight: ColorPalette.light.primary.light,
    cardColor: ColorPalette.light.scaffoldBackground,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPalette.light.cursor,
      selectionHandleColor: ColorPalette.light.primary,
      selectionColor: ColorPalette.light.textSelectionColor,
    ),
    dividerTheme: DividerThemeData(color: ColorPalette.light.divider, thickness: 1.5, space: 0),
    //! AppBar
    appBarTheme: AppBarTheme(
      elevation: 4,
      // shadowColor: ColorPalette.light.toolbarShadow,
      color: ColorPalette.light.primary.withOpacity(0.3),
      iconTheme: IconThemeData(color: ColorPalette.light.textPrimary, size: 18),
      actionsIconTheme: IconThemeData(color: ColorPalette.light.textPrimary),
      titleTextStyle: TextTheme(
        titleLarge: Typography.englishLike2018.titleSmall!.copyWith(
            height: 1.5, letterSpacing: 0, color: ColorPalette.light.textPrimary, fontWeight: FontWeight.w900),
      ).titleLarge,
      titleSpacing: 0,
    ),
    iconTheme: IconThemeData(color: ColorPalette.light.textSecondary),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: ColorPalette.light.textSecondary,
      labelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorPalette.light.background,
    ),
    //!button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorPalette.light.primary),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shadowColor: MaterialStateProperty.all(ColorPalette.light.primary.withOpacity(0.6)),
        overlayColor: MaterialStateProperty.all(ColorPalette.light.splash),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) => ColorPalette.light.primary),
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) => ColorPalette.light.scaffoldBackground),
        overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) => ColorPalette.light.splash),
        elevation: MaterialStateProperty.all(0),
      ),
    ),
    //! Texts
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 12,
        color: ColorPalette.light.textSecondary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: ColorPalette.light.textPrimary,
        height: 1.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        height: 1.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: ColorPalette.light.textPrimary,
        height: 1.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: ColorPalette.light.textPrimary,
        height: 1.5,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w700,
        height: 1.5,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0,
      ),
      displayLarge: TextStyle(
        fontSize: 96,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0,
        // fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 60,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 48,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 34,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: ColorPalette.light.textPrimary,
        fontWeight: FontWeight.w700,
        height: 1.5,
        letterSpacing: 0,
      ),
    ).apply(),
  );
}
