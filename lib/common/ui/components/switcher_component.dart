import 'package:flutter/material.dart';

class SwitcherComponent extends StatelessWidget {
  const SwitcherComponent({
    required this.statement,
    required this.firstChild,
    required this.secondChild,
    this.curve = Curves.easeIn,
    this.duration = const Duration(milliseconds: 1000),
    super.key,
  });
  final bool statement;
  final Widget firstChild;
  final Widget secondChild;
  final Curve curve;
  final Duration duration;
  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: duration,
        switchInCurve: curve,
        child: statement ? firstChild : secondChild,
      );
}
