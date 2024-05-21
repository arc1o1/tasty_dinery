import 'package:tasty_dinery/features/client/authentication/controllers/login/login_controller.dart';
import 'package:tasty_dinery/features/client/authentication/screens/3_signup/signup.dart';
import 'package:tasty_dinery/features/client/authentication/screens/4_password_configuration/forgot_password.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/utils/validators/validator.dart';

class CcLoginForm extends StatelessWidget {
  const CcLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // controller instantiation
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: CcSizes.spaceBtnItems_1),
        child: Column(
          children: [
            // email
            TextFormField(
              controller: controller.email,
              validator: (value) => CcValidator.validateEmail(value),
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
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    CcValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded)),
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
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields / 2),

            // remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    Text(
                      CcTexts.rememberMe,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: CcColors.black),
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

            // sign in button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(CcTexts.signIn),
              ),
            ),

            // admin login
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     TextButton(
            //       onPressed: () => Get.to(() => const AdminLoginScreen()),
            //       child: Text(
            //         "Login as Admin",
            //         style: Theme.of(context).textTheme.labelLarge!.copyWith(
            //             fontWeight: FontWeight.w600,
            //             color: Theme.of(context).primaryColor),
            //       ),
            //     ),
            //   ],
            // ),

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
                        color: CcColors.black,
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
