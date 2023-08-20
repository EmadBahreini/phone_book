import 'package:flutter/material.dart';
import '../appTheme/app_theme_helper.dart';

class ColorPalette {
  const ColorPalette({
    required this.primary,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.wtf,
    required this.scaffoldBackground,
    required this.background,
    required this.selectedBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textCaption,
    required this.textDisabled,
    required this.divider,
    required this.shadow,
    required this.toolbarShadow,
    required this.splash,
    required this.disabled,
    required this.cursor,
    required this.textSelectionColor,
    required this.icon,
    required this.hint,
    required this.darkWhite,
    required this.green,
    required this.blue,
    required this.lightBlue,
    required this.grey,
    this.white = Colors.white,
    this.black = Colors.black,
  });

  // ignore: avoid_unused_constructor_parameters
  factory ColorPalette.of(BuildContext context) => light;

  // factory ColorPalette.of(BuildContext context) =>
  //     ColorPalette.fromBrightness(MediaQuery.of(context).platformBrightness);
  // factory ColorPalette.fromBrightness(Brightness brightness) => brightness == Brightness.light ? light : dark;

  final ColorMode primary;
  final ColorMode success;
  final ColorMode error;
  final ColorMode warning;
  final ColorMode info;
  final ColorMode wtf;
  final Color textPrimary;
  final Color textSecondary;
  final Color hint;
  final Color textCaption;
  final Color textDisabled;
  final Color scaffoldBackground;
  final Color background;
  final Color selectedBackground;
  final Color divider;
  final Color shadow;
  final Color toolbarShadow;
  final Color splash;
  final Color disabled;
  final Color cursor;
  final Color textSelectionColor;
  final Color icon;
  final Color darkWhite;
  final Color green;
  final ColorMode blue;
  final Color lightBlue;
  final Color grey;

  // no theme colors
  final Color black;
  final Color white;

  static ColorPalette light = ColorPalette(
    primary: ColorMode(
      main: const Color(0xff02ABC0),
      light: const Color(0xff48ABE3),
      dark: const Color(0xff026468),
      background: const Color.fromARGB(255, 191, 232, 255),
    ),
    success: ColorMode(
      main: const Color(0xff46C93A),
      light: const Color(0xff68DC5E),
      dark: const Color(0xff33BB26),
      background: const Color(0xffECFAEB),
    ),
    error: ColorMode(
      main: const Color(0xffFF3849),
      light: const Color(0xffFFD6D9),
      dark: const Color(0xffDF2A3A),
      background: const Color(0xffFFEAEC),
    ),
    warning: ColorMode(
      main: const Color(0xffFFBA00),
      light: const Color(0xffFFCF4D),
      dark: const Color(0xffEDAD00),
      background: const Color(0xffFFF8E5),
    ),
    info: ColorMode(
      main: const Color(0xff1489FE),
      light: const Color(0xff49A3FC),
      dark: const Color(0xff1577D8),
      background: const Color(0xffE7F3FF),
    ),
    wtf: ColorMode(
      main: const Color(0xffCB38FF),
      light: const Color(0xffE395FF),
      dark: const Color(0xff9D12CE),
      background: const Color(0xffFAEAFF),
    ),
    scaffoldBackground: const Color(0xfff9f9f9),
    background: const Color(0xfff3f3f3),
    selectedBackground: const Color(0xffE0ECEC),
    textPrimary: const Color(0xff3B3B3B),
    textSecondary: const Color(0xff45454D),
    hint: const Color(0xff919199),
    textCaption: const Color(0xff5C5C66),
    textDisabled: const Color(0xffC2C2CC),
    divider: const Color(0xffCFD4DA),
    shadow: const Color(0x1E000000),
    toolbarShadow: const Color(0x3B000000),
    splash: const Color(0x0F000000),
    disabled: const Color(0xffe3e3e3),
    cursor: const Color(0xff48ABE3),
    textSelectionColor: const Color(0x364b57d6),
    icon: const Color(0xff888888),
    darkWhite: const Color(0xffF0F0F5),
    green: const Color(0xff24BF8B),
    blue: ColorMode(
        main: const Color(0xff48ABE3),
        background: const Color(0xffa2e9f6),
        light: const Color(0xffa2e9f6),
        dark: const Color(0xff48ABE3)),
    lightBlue: const Color(0xffA2E9F6),
    grey: const Color(0xffCFD4EA),
  );
}

class ColorMode extends Color {
  ColorMode({required this.main, required this.light, required this.dark, required this.background})
      : super.fromARGB(main.alpha, main.red, main.green, main.blue);

  final Color main;
  final Color light;
  final Color dark;
  final Color background;

  Color byBrightness(BuildContext context, {bool invert = false}) {
    bool condition = context.theme.brightness == Brightness.light;
    if (invert) {
      condition = !condition;
    }
    return condition ? light : dark;
  }
}
