import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/success_screen/success_screen.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class VerificationEmailController extends GetxController {
  static VerificationEmailController get instance => Get.find();

  // send email whenever cerification screen appear
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      CcLoaders.successSnackBar(
          title: "Email sent",
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();

        final user = FirebaseAuth.instance.currentUser;

        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: CcImages.success,
              title: CcTexts.accountcreatedTitle,
              subtitle: CcTexts.accountcreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  // manually check if email is verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          title: CcTexts.accountcreatedTitle,
          subtitle: CcTexts.accountcreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
