import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/devices/device_utility.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcSearchContainer extends StatelessWidget {
  const CcSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search_rounded,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: CcSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,

        // container child
        child: Container(
          width: CcDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(CcSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? CcColors.dark.withOpacity(0.9)
                    : CcColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(CcSizes.cardRadiusLg),
            border: showBorder
                ? Border.all(color: dark ? Colors.white : Colors.black)
                : null,
          ),

          // row child of a container
          child: Row(
            children: [
              // icon
              Icon(icon, color: dark ? Colors.white : Colors.black),

              const SizedBox(width: CcSizes.spaceBtnItems_1),

              // label
              Text(text,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: dark ? Colors.white : CcColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
