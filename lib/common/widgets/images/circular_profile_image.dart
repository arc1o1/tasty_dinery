import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcCircularProfileImage extends StatelessWidget {
  const CcCircularProfileImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor = Colors.white,
    this.width = 50,
    this.height = 50,
    this.padding = CcSizes.xs,
    this.fit = BoxFit.cover,
  });

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(500),
      ),

      // image
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
