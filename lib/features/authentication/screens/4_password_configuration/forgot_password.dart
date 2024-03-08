import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/authentication/screens/4_password_configuration/reset_password.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NeutriffPro'),
                ),
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnSections * 2),

            // textfield
            TextFormField(
              decoration: const InputDecoration(
                labelText: CcTexts.email,
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // submit button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPassword()),
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
