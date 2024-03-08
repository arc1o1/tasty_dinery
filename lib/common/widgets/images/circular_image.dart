import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

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
  });

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(500),
      ),

      // image
      child: Center(
        child: CircleAvatar(
          backgroundImage: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
        ),
      ),
    );
  }
}
