import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcBrandTitleText extends StatelessWidget {
  const CcBrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,

      // check which brand size is required and set the style
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.copyWith(
              color: CcHelperFunctions.isDarkMode(context)
                  ? CcColors.light
                  : CcColors.dark)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: CcHelperFunctions.isDarkMode(context)
                      ? CcColors.light
                      : CcColors.dark)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: CcHelperFunctions.isDarkMode(context)
                          ? CcColors.light
                          : CcColors.dark)
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: CcHelperFunctions.isDarkMode(context)
                          ? CcColors.light
                          : CcColors.dark),
    );
  }
}
