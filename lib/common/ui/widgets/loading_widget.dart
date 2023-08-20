import 'dart:math' as math show sin, pi;
import 'package:flutter/widgets.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.color = const Color(0xff377DFF),
    this.size = 30.0,
    // this.itemBuilder,
    this.duration = const Duration(milliseconds: 900),
    this.controller,
  });

  final Color? color;
  final double size;
  // final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox.fromSize(
          size: Size(widget.size * 2, widget.size),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                3,
                (i) => ScaleTransition(
                      scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2).animate(_controller),
                      child: SizedBox.fromSize(size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
                    )),
          ),
        ),
      );

  Widget _itemBuilder(int index) =>
      DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class DelayTween extends Tween<double> {
  DelayTween({
    required this.delay,
    double? begin,
    double? end,
  }) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
