import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/client/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/validators/validator.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(ForgotPasswordController());

    // saffold
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CcSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // headings
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  CcTexts.forgotPasswordTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: CcSizes.spaceBtnItems_1),
                Text(
                  CcTexts.forgotPasswordSubtitle,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnSections * 2),

            // textfield
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: CcValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: CcTexts.email,
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // submit button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text("Submit"),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1),
          ],
        ),
      ),
    );
  }
}
