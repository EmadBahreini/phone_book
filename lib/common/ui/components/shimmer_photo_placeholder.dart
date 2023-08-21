import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/assets.dart';

class ShimmerPhotoPlaceholder extends StatelessWidget {
  const ShimmerPhotoPlaceholder({super.key, this.height, this.width, this.padding = const EdgeInsets.all(5)});
  final double? height;
  final double? width;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Shimmer.fromColors(
      baseColor: (brightness == Brightness.light) ? const Color(0x08000000) : const Color(0x08FFFFFF),
      highlightColor: (brightness == Brightness.light) ? const Color(0x12000000) : const Color(0x12FFFFFF),
      direction: ShimmerDirection.rtl,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: SvgPicture.asset(Assets.photoIcon, color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
