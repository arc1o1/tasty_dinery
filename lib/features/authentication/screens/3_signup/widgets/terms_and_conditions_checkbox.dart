import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CcTermsAndConditionsCheckBox extends StatelessWidget {
  const CcTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // remember me
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: '${CcTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: dark ? CcColors.white : CcColors.black),
                ),
                TextSpan(
                  text: CcTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: dark ? CcColors.white : CcColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? CcColors.white : CcColors.primary,
                      ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: dark ? CcColors.white : CcColors.black),
                ),
                TextSpan(
                  text: CcTexts.termsOfUse,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: dark ? CcColors.white : CcColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? CcColors.white : CcColors.primary,
                      ),
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
