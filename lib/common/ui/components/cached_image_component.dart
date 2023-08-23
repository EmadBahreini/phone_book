import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/common/ui/components/shimmer_photo_placeholder.dart';

class CachedImageComponent extends StatelessWidget {
  const CachedImageComponent(this.url,
      {super.key, this.width, this.height, this.padding = EdgeInsets.zero, this.radius = 20});
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
          child: (url?.isEmpty ?? true)
              ? Container(
                  color: context.colors.primary.withOpacity(0.3),
                  width: width,
                  height: height,
                  child: Icon(
                    Icons.person,
                    size: (height ?? 100) > 50 ? 50 : null,
                  ),
                )
              : CachedNetworkImage(
                  width: width,
                  height: height,
                  imageUrl: url ?? '',
                  fit: BoxFit.fill,
                  errorWidget: (_, __, ___) => SizedBox(
                    width: width,
                    height: height,
                    child: Icon(
                      Icons.person,
                      size: (height ?? 100) > 50 ? 40 : null,
                    ),
                  ),
                  placeholder: (context, url) => ShimmerPhotoPlaceholder(
                    height: height ?? 100,
                    width: width ?? 100,
                  ),
                ),
        ),
      );
}
