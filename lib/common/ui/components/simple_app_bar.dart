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
    this.backLeading = false,
  });
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double elevation;
  final double toolbarHeight;
  final PreferredSizeWidget? appbarBotom;
  final bool centerTitle;
  final bool haveLeading;
  final bool backLeading;
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
            ? IconButton(
                icon: Icon(backLeading ? Icons.arrow_back : Icons.close, size: 24),
                onPressed: () => Navigator.pop(context))
            : null,
        actions: actions,
        shadowColor: ColorPalette.of(context).shadow.withOpacity(0.30),
        bottom: appbarBotom,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
      );
}
