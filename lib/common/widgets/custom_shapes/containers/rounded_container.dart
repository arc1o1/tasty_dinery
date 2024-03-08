import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcRoundedContainer extends StatelessWidget {
  const CcRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.radius = CcSizes.cardRadiusLg,
    this.borderColor = CcColors.borderPrimary,
    this.backgroundColor = CcColors.white,
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
