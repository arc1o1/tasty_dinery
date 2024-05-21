import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';

class CcCircularImage extends StatelessWidget {
  const CcCircularImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor = Colors.white,
    this.width = 50,
    this.height = 50,
    this.padding = CcSizes.xs,
    this.fit = BoxFit.cover,
    this.borderRadius = 500,
    this.sWidth = 100,
    this.sHeight = 100,
    this.sRadius = 100,
  });

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding, borderRadius;
  final double sWidth, sHeight, sRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      // image
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CcShimmerEffect(
                          width: sWidth, height: sHeight, radius: sRadius),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
