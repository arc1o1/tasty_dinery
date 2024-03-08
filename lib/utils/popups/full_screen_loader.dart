import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/loaders/animation_loader.dart';

class CcFullScreenLoader {
  // open a full screen loading dialog with a given text and animation
  // this method doesnt return anything
  //
  // parameters
  //  - text: The text to be displayed in the loading dialog
  //  - animation: the Lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // for overlay dialog
      barrierDismissible: false, // can not be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // disable poppiing with back button
        child: Container(
          color: Colors.grey.shade300,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // adjustment required / remove
              CcAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // stop the currently open loading dialog
  // the method doesnt return anything

  static stopLoading() {
    // close the dialog using Navigator
    Navigator.of(Get.overlayContext!).pop();
  }
}
