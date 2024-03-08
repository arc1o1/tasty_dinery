import 'package:tasty_dinery/common/widgets/login_signup/form_divider.dart';
import 'package:tasty_dinery/common/widgets/login_signup/social_buttons.dart';
import 'package:tasty_dinery/features/authentication/screens/3_signup/verify_email.dart';
// import 'package:tasty_dinery/features/authentication/screens/3_signup/verify_email.dart';
import 'package:tasty_dinery/features/authentication/screens/3_signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CcSignUpForm extends StatelessWidget {
  const CcSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CcSizes.spaceBtnItems_1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // first name
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: CcTexts.firstName,
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: CcSizes.spaceBtnInputFields),

                // last name
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: CcTexts.lastName,
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // // username
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: CcTexts.username,
            //     prefixIcon: Icon(
            //       Icons.person_add_alt_rounded,
            //     ),
            //   ),
            //  ),

            // const SizedBox(height: CcSizes.spaceBtnInputFields),

            // email
            TextFormField(
              decoration: const InputDecoration(
                labelText: CcTexts.email,
                prefixIcon: Icon(
                  Icons.email_rounded,
                ),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // phone number
            TextFormField(
              decoration: const InputDecoration(
                labelText: CcTexts.phoneNo,
                prefixIcon: Icon(Icons.phone_android_rounded),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: CcTexts.password,
                  suffixIcon: Icon(Icons.visibility_rounded),
                  prefixIcon: Icon(Icons.lock)),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_2),

            // agreeing to privacy terms
            const CcTermsAndConditionsCheckBox(),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // sign up button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmail()),
                child: const Text(CcTexts.createAccount),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // divider
            CcFormDivider(dividerText: CcTexts.orSignupWith.capitalize!),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // social button
            const CcSocialButton()
          ],
        ),
      ),
    );
  }
}
