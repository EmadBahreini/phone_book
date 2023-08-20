import 'dart:ui';

class AppConfig {
  static const String name = 'Phone Book';
  static const bool debug = true;

  static const String localePath = 'assets/translations';
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
  ];
  static const Locale startLocale = Locale('en', 'US');
}
