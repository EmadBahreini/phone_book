import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension LocaleUtils on BuildContext {
  bool get isEn => locale.languageCode == 'en';

  bool get isFa => locale.languageCode == 'fa';

  bool get isRtl => isFa;

  bool get isLtr => !isRtl;

  ui.TextDirection get localeDirection => isRtl ? ui.TextDirection.rtl : ui.TextDirection.ltr;

  ui.TextDirection get invertLocaleDirection => isRtl ? ui.TextDirection.ltr : ui.TextDirection.rtl;
}
