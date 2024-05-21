import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_text.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcBrandTitleWithVerifiedIcon extends StatelessWidget {
  const CcBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CcColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CcBrandTitleText(
              title: title,
              color: textColor,
              maxLines: maxLines,
              textAlign: textAlign,
              brandTextSize: brandTextSize),
        ),

        const SizedBox(width: CcSizes.xs),

        // icon
        Icon(Icons.verified_rounded, color: iconColor, size: CcSizes.iconXs),
      ],
    );
  }
}
