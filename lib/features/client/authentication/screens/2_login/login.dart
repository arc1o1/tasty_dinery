import 'package:get/utils.dart';
import 'package:tasty_dinery/common/styles/spacing_styles.dart';
import 'package:tasty_dinery/common/widgets/login_signup/form_divider.dart';
import 'package:tasty_dinery/common/widgets/login_signup/social_buttons.dart';
import 'package:tasty_dinery/features/client/authentication/screens/2_login/widgets/login_form.dart';
import 'package:tasty_dinery/features/client/authentication/screens/2_login/widgets/login_header.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: CcSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo and title
              const CcLoginHeader(),

              // form
              const CcLoginForm(),

              // divider
              CcFormDivider(dividerText: CcTexts.orSignInWith.capitalize!),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // footer

              const CcSocialButton()
            ],
          )),
    );
  }
}
