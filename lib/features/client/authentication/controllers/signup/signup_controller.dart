import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/data/repositories/user/user_repository.dart';
import 'package:tasty_dinery/features/client/authentication/models/user/user_model.dart';
import 'package:tasty_dinery/features/client/authentication/screens/3_signup/verify_email.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for last name input
  final userName = TextEditingController(); // controller for user name input
  final firstName = TextEditingController(); // controller for first name input
  final password = TextEditingController(); // controller for password input
  final phoneNumber = TextEditingController(); // controller for phone number
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // form

//=================signup================================================================================================
  Future<void> signup() async {
    try {
      // start loading
      CcFullScreenLoader.openLoadingDialog(
          "processing your information...", CcImages.clockLoadingAnimation);

//=================check internet connectivity============================================================================
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove the loader
        CcFullScreenLoader.stopLoading();
        return;
      }

//==================form validation=======================================================================================
      if (!signupFormKey.currentState!.validate()) {
        // remove the loader
        CcFullScreenLoader.stopLoading();
        return;
      }

//==================privacy policy check===================================================================================
      if (privacyPolicy.value == false) {
        CcLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must read and accept Privacy Policy and Terms of use.",
        );
        CcFullScreenLoader.stopLoading();
        return;
      }

//------------------register user in the firebase authentication & save user data in firebase-------------------------------
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

//------------------save authenticated user data in firebase firestore------------------------------------------------------
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: firstName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
          role: 'client');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

//------------------remove the loader--------------------------------------------------------------------------------------
      CcFullScreenLoader.stopLoading();

//------------------show success message----------------------------------------------------------------------------------
      CcLoaders.successSnackBar(
          title: "Congratulations",
          message:
              "Account was created successfully. Verify email to continue");

//------------------move to verify email screen----------------------------------------------------------------------------
      Get.to(() => VerifyEmail(email: email.text.trim()));
    } catch (e) {
      // remove the loader
      CcFullScreenLoader.stopLoading();

//------------------show some generic errors to the user-------------------------------------------------------------------
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
