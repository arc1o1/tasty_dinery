import 'package:get/get.dart';
import 'package:tasty_dinery/features/authentication/controllers/signup/signup_controller.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class CcTermsAndConditionsCheckBox extends StatelessWidget {
  const CcTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // instantiate controller
    final controller = SignupController.instance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // remember me
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Obx(
                () => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value =
                      !controller.privacyPolicy.value,
                ),
              ),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: '${CcTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600, color: CcColors.black),
                ),
                TextSpan(
                  text: CcTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: CcColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: CcColors.primary,
                      ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600, color: CcColors.black),
                ),
                TextSpan(
                  text: CcTexts.termsOfUse,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: CcColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: CcColors.primary,
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
