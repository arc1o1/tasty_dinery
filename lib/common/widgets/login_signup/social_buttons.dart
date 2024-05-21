import 'package:get/get.dart';
import 'package:tasty_dinery/features/client/authentication/controllers/login/login_controller.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CcSocialButton extends StatelessWidget {
  const CcSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // controller instantiation
    final controller = Get.put(LoginController());

    // buttons
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 01
        // google sign in button
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border: Border.all(color: CcColors.darkGrey),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: CcSizes.iconLg,
              height: CcSizes.iconLg,
              image: AssetImage(CcImages.google),
            ),
          ),
        ),

        const SizedBox(width: CcSizes.spaceBtnSections),

        // 02
        // apple sign in button
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border: Border.all(color: CcColors.darkGrey),
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
