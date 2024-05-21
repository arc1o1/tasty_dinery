import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcCircularIcon extends StatelessWidget {
  const CcCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = CcSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : CcHelperFunctions.isDarkMode(context)
                ? CcColors.black.withOpacity(.9)
                : CcColors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
