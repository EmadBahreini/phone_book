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
  final String? titleFontFamily;
  final PreferredSizeWidget? appbarBotom;
  final double? additionalSize;

  final Color? appBarBackgroundColor;

  @override
  _PageComponentState createState() => _PageComponentState();
}

class _PageComponentState extends State<PageComponent> {
  final double _fullShadowScrollPoint = 20;
  final double _endTextAnimationScrollPoint = 55;
  final double _fullElevation = 8;
  final double _fullDecreaseFontSize = 3;
  final double _fullDecreaseToolbarHeight = 6;

  double _elevation = 0;
  double _decreaseFontSize = 0;
  double _decreaseToolbarHeight = 0;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _listener() {
    double _offset = _scrollController.offset;
    double _shadowScrollPoint = _offset < 0
        ? 0
        : _offset > _fullShadowScrollPoint
            ? _fullShadowScrollPoint
            : _offset;
    double _textAnimationScrollPoint = _offset < 0
        ? 0
        : _offset > _endTextAnimationScrollPoint
            ? _endTextAnimationScrollPoint
            : _offset;
    setState(() {
      _elevation = (_shadowScrollPoint / _fullShadowScrollPoint) * _fullElevation;
      _decreaseFontSize = (_textAnimationScrollPoint / _endTextAnimationScrollPoint) * _fullDecreaseFontSize;
      if (widget.enableAppBarAnimation) {
        _decreaseToolbarHeight =
            (_textAnimationScrollPoint / _endTextAnimationScrollPoint) * _fullDecreaseToolbarHeight;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SimpleAppBar(
          null,
          titleWidget: widget.widgetTitle ??
              Text(widget.title ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontFamily: widget.titleFontFamily,
                      fontSize: (Theme.of(context).textTheme.titleSmall!.fontSize! + _fullDecreaseFontSize) -
                          _decreaseFontSize)),
          actions: widget.appBarActions,
          elevation: widget.alwaysElevation ? 8 : _elevation,
          toolbarHeight: widget.widgetTitle != null
              ? 56
              : widget.enableAppBarAnimation
                  ? (kToolbarHeight + (widget.additionalSize ?? 0) + _fullDecreaseToolbarHeight) -
                      _decreaseToolbarHeight
                  : kToolbarHeight + (widget.additionalSize ?? 0),
          appbarBotom: widget.appbarBotom,
          centerTitle: widget.centerTitle,
          backgroundColor: widget.appBarBackgroundColor,
        ),
        key: widget.scaffoldKey,
        body: PrimaryScrollController(controller: _scrollController, child: widget.body),
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
      );
}
