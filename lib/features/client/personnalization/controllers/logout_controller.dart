import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/features/client/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

  Future<void> logout() async {
    try {
      // start loading
      CcFullScreenLoader.openLoadingDialog(
          "Logging out...", CcImages.clockLoadingAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // log out the user
      await AuthenticationRepository.instance.logout();

      // remove loader
      CcFullScreenLoader.stopLoading();

      // screen redirect
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
