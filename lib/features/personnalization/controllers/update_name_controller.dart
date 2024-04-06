// manage user related functionalities
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/user/user_repository.dart';
import 'package:tasty_dinery/features/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/personnalization/screens/profile/profile_screen.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  // phone number
  final phoneNumber = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      CcFullScreenLoader.openLoadingDialog(
        "we are updating your information...",
        CcImages.clockLoadingAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };

      await userRepository.updateSingleField(name);

      // update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      CcFullScreenLoader.stopLoading();

      // show success message
      CcLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated.',
      );

      // move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> updatePhoneNumber() async {
    try {
      // start loading
      CcFullScreenLoader.openLoadingDialog(
        "we are updating your information...",
        CcImages.clockLoadingAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // update user's first and last name in the firebase firestore
      Map<String, dynamic> phoneNo = {'PhoneNumber': phoneNumber.text.trim()};

      await userRepository.updateSingleField(phoneNo);

      // update the Rx User value
      userController.user.value.phoneNumber = phoneNumber.text.trim();

      // remove loader
      CcFullScreenLoader.stopLoading();

      // show success message
      CcLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Phone Number updated successfully.',
      );

      // move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
