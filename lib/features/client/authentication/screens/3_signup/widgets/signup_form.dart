import 'package:tasty_dinery/common/widgets/login_signup/form_divider.dart';
import 'package:tasty_dinery/common/widgets/login_signup/social_buttons.dart';
import 'package:tasty_dinery/features/client/authentication/controllers/signup/signup_controller.dart';
import 'package:tasty_dinery/features/client/authentication/screens/3_signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/utils/validators/validator.dart';

class CcSignUpForm extends StatelessWidget {
  const CcSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // instantiate controller
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
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
                    controller: controller.firstName,
                    validator: (value) =>
                        CcValidator.validateEmptyText("First Name", value),
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
                    controller: controller.lastName,
                    validator: (value) =>
                        CcValidator.validateEmptyText("Last Name", value),
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
            //   controller: controller.userName
            //   validator: (value) => CcValidator.validateEmptyText("Username", value),
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
              controller: controller.email,
              validator: (value) => CcValidator.validateEmail(value),
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
              controller: controller.phoneNumber,
              validator: (value) => CcValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                labelText: CcTexts.phoneNo,
                prefixIcon: Icon(Icons.phone_android_rounded),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => CcValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: CcTexts.password,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded)),
                ),
              ),
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
                onPressed: () => controller.signup(),
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
