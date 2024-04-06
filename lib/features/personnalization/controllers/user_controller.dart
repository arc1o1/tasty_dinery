import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/data/repositories/user/user_repository.dart';
import 'package:tasty_dinery/features/authentication/models/user/user_model.dart';
import 'package:tasty_dinery/features/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/features/personnalization/screens/profile/widgets/reauth_user_login_form.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class UserController extends GetxController {
  // initialize the controller
  static UserController get instance => Get.find();

  // user model observer
  Rx<UserModel> user = UserModel.empty().obs;

  // loader
  final profileLoading = false.obs;

  // initialize the repository for saving user data
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  // override function
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // update the Rx user and check if user data is already stored....if not store a new data
      await fetchUserRecord();

      // if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');

          // map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: nameParts[0],
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      CcLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile.",
      );
    }
  }

  // delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CcSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete this account permanently? This action is not reversible and all your data will be removed permanently.",
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        onPressed: () async => deleteUserAccount(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: CcSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('cancel'),
      ),
    );
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      CcFullScreenLoader.openLoadingDialog(
        'Processing',
        CcImages.clockLoadingAnimation,
      );

      // first reauthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // re-verify auth email
        if (provider == 'google.com') {
          // reauth
          await auth.signInWithGoogle();

          // delete account
          await auth.deleteAccount();

          // stop loading
          CcFullScreenLoader.stopLoading();

          // redirect
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          // stop loading
          CcFullScreenLoader.stopLoading();

          // redirect to reauth
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      // stop loading
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  // reauthenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      CcFullScreenLoader.openLoadingDialog(
        'Processing',
        CcImages.clockLoadingAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!reAuthFormKey.currentState!.validate()) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // authenticate
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      // stop loading
      CcFullScreenLoader.stopLoading();

      // redirect
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // stop loading
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  // upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        // upload image
        final imageUrl = await userRepository.uploadImage(
          'Users/Images/Profile/',
          image,
        );

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await userRepository.updateSingleField(json);

        // display image
        user.value.profilePicture = imageUrl;

        user.refresh();

        CcLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Profile picture was successfully updated',
        );
      }
    } catch (e) {
      // stop loading
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
