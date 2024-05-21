import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/features/client/authentication/screens/4_password_configuration/reset_password.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      CcFullScreenLoader.openLoadingDialog(
          "processing your information...", CcImages.clockLoadingAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove the loader
        CcFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        // remove the loader
        CcFullScreenLoader.stopLoading();
        return;
      }
      // send email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // remove the loader
      CcFullScreenLoader.stopLoading();

      // show success screen
      CcLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset your Password");

      // redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      // remove loader
      CcFullScreenLoader.stopLoading();
    }
  }

  // resend password
  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      CcFullScreenLoader.openLoadingDialog(
          "processing your information...", CcImages.clockLoadingAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove the loader
        CcFullScreenLoader.stopLoading();
        return;
      }

      // send email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove the loader
      CcFullScreenLoader.stopLoading();

      // show success screen
      CcLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset your Password");
    } catch (e) {
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      // remove loader
      CcFullScreenLoader.stopLoading();
    }
  }
}
