import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/success_screen/success_screen.dart';
import 'package:tasty_dinery/features/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.offAll(() => const LoginScreen()),
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
                width: CcHelperFunctions.screenWidth() * .6,
                height: CcHelperFunctions.screenHeight() * .3,
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
                CcTexts.customerSupportemail,
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
                  onPressed: () => Get.to(() => SuccessScreen(
                        image: CcImages.authSuccess,
                        title: CcTexts.accountcreatedTitle,
                        subtitle: CcTexts.accountcreatedSubTitle,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                ),
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
