import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone_book/common/ui/components/shimmer_photo_placeholder.dart';

import '../../resources/assets.dart';

class CachedImageComponent extends StatelessWidget {
  const CachedImageComponent(this.url,
      {super.key, this.width, this.height, this.padding = EdgeInsets.zero, this.radius = 12});
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final double radius;
  final String? url;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: url ?? '',
            fit: BoxFit.fill,
            errorWidget: (_, __, ___) => SizedBox(
              width: width,
              height: height,
              child: SvgPicture.asset(Assets.photoIcon),
            ),
            placeholder: (context, url) => ShimmerPhotoPlaceholder(
              height: height ?? 100,
              width: width ?? 100,
            ),
          ),
        ),
      );
}
