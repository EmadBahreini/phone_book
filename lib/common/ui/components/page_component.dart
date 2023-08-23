import 'package:flutter/material.dart';
import 'package:phone_book/common/ui/components/simple_app_bar.dart';

class PageComponent extends StatefulWidget {
  const PageComponent({
    required this.body,
    this.title,
    this.appBarActions,
    this.scaffoldKey,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.enableAppBarAnimation = true,
    this.centerTitle = false,
    this.alwaysElevation = false,
    this.backLeading = false,
    this.titleFontFamily,
    this.appbarBotom,
    this.additionalSize,
    this.widgetTitle,
    this.appBarBackgroundColor,
  });

  final String? title;
  final Widget body;
  final Widget? widgetTitle;
  final List<Widget>? appBarActions;
  final Key? scaffoldKey;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool enableAppBarAnimation;
  final bool alwaysElevation;
  final bool centerTitle;
  final bool backLeading;
  final String? titleFontFamily;
  final PreferredSizeWidget? appbarBotom;
  final double? additionalSize;

  final Color? appBarBackgroundColor;

  @override
  _PageComponentState createState() => _PageComponentState();
}

class _PageComponentState extends State<PageComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SimpleAppBar(
          null,
          titleWidget: widget.widgetTitle ?? Text(widget.title ?? '', style: Theme.of(context).textTheme.titleSmall),
          actions: widget.appBarActions,
          toolbarHeight: widget.widgetTitle != null ? 56 : kToolbarHeight + (widget.additionalSize ?? 0),
          appbarBotom: widget.appbarBotom,
          centerTitle: widget.centerTitle,
          backgroundColor: widget.appBarBackgroundColor,
          backLeading: widget.backLeading,
        ),
        key: widget.scaffoldKey,
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
      );
}
