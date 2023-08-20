import 'package:flutter/material.dart';

import 'color_palette.dart';

extension ColorPaletteHelper on BuildContext {
  ColorPalette get colors => ColorPalette.of(this);
}
