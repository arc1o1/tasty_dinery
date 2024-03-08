import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:tasty_dinery/features/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CcSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(CcImages.authEmailDelivery),
                width: CcHelperFunctions.screenWidth() * .6,
                height: CcHelperFunctions.screenHeight() * .3,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnSections,
              ),

              // email title and subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              Text(
                CcTexts.changePasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              Text(
                CcTexts.changePasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnSections,
              ),

              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text("Done"),
                ),
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgotPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text("Resend Email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
