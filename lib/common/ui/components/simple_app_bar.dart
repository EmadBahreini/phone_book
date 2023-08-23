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
    this.haveLeading = true,
  });
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double elevation;
  final double toolbarHeight;
  final PreferredSizeWidget? appbarBotom;
  final bool centerTitle;
  final bool haveLeading;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        title: titleWidget ??
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
        leading: haveLeading
            ? IconButton(icon: const Icon(Icons.close, size: 20), onPressed: () => Navigator.pop(context))
            : null,
        actions: actions,
        elevation: elevation,
        shadowColor: ColorPalette.of(context).shadow.withOpacity(0.30),
        bottom: appbarBotom,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
      );
}
