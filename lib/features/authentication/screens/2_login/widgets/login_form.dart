import 'package:tasty_dinery/features/authentication/screens/3_signup/signup.dart';
import 'package:tasty_dinery/features/authentication/screens/4_password_configuration/forgot_password.dart';
import 'package:tasty_dinery/navigation_menu.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CcLoginForm extends StatelessWidget {
  const CcLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);

    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: CcSizes.spaceBtnItems_1),
        child: Column(
          children: [
            // email
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.email_rounded,
                ),
                labelText: CcTexts.email,
                hintText: 'eg. john11@yahoo.com',
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // password
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.visibility_rounded,
                ),
                labelText: CcTexts.password,
                hintText: 'Enter your password',
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields / 2),

            // remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(
                      CcTexts.rememberMe,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: dark ? CcColors.white : CcColors.black),
                    ),
                  ],
                ),

                // forgot password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: Text(
                    CcTexts.forgotPassword,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1),

            // sign in button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(CcTexts.signIn),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1),

            // create account button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(
                  CcTexts.createAccount,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: dark ? CcColors.white : CcColors.black,
                        fontSize: 15,
                      ),
                ),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_2),
          ],
        ),
      ),
    );
  }
}
