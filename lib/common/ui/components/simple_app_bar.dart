import 'package:flutter/material.dart';

import '../../style/colorPalette/color_palette.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar(
    this.title, {
    super.key,
    this.actions,
    this.elevation = 0,
    this.toolbarHeight = kToolbarHeight,
    this.titleWidget,
    this.centerTitle = false,
    this.appbarBotom,
    this.backgroundColor,
  });
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double elevation;
  final double toolbarHeight;
  final PreferredSizeWidget? appbarBotom;
  final bool centerTitle;

  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        title: titleWidget ??
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.subtitle2,
            ),
        leading:
            IconButton(icon: Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => Navigator.pop(context)),
        actions: actions,
        elevation: elevation,
        shadowColor: ColorPalette.of(context).shadow.withOpacity(0.30),
        bottom: appbarBotom,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
      );
}
