import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/user/user_repository.dart';
import 'package:tasty_dinery/features/authentication/models/user/user_model.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class UserController extends GetxController {
  // initialize the controller
  static UserController get instance => Get.find();

  // initialize the repository for saving user data
  final userRepository = Get.put(UserRepository());

  // save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        // map data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: nameParts[0],
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      CcLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile.",
      );
    }
  }
}
