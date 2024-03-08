import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/features/authentication/controllers/signup/verification_email_controller.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(VerificationEmailController());

    // content
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => AuthenticationRepository.instance.logout(),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CcSizes.defaultSpace),
          child: Column(
            children: [
              // image
              Image(
                image: const AssetImage(
                  CcImages.authEmailDelivery,
                ),
                width: CcHelperFunctions.screenWidth() * .5,
                height: CcHelperFunctions.screenHeight() * .2,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnSections,
              ),

              // title and subtitle
              Text(
                CcTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              Text(
                CcTexts.confirmEmailSubTitle,
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
                    child: const Text(CcTexts.tContinue),
                    onPressed: () => controller.checkEmailVerificationStatus()),
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text(
                    CcTexts.resendEmail,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => controller.sendEmailVerification(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
