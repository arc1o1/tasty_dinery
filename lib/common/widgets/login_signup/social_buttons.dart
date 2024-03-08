import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CcSocialButton extends StatelessWidget {
  const CcSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border:
                Border.all(color: dark ? CcColors.white : CcColors.darkGrey),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CcSizes.iconLg,
              height: CcSizes.iconLg,
              image: AssetImage(CcImages.google),
            ),
          ),
        ),
        const SizedBox(width: CcSizes.spaceBtnSections),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border:
                Border.all(color: dark ? CcColors.white : CcColors.darkGrey),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CcSizes.iconXl,
              height: CcSizes.iconXl,
              image: AssetImage(CcImages.apple),
            ),
          ),
        ),
      ],
    );
  }
}
