import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/list_tile/payment_tile.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/shop/models/payment_method_model.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  // var
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  final userController = UserController.instance;

  final phoneNumber = TextEditingController();

  GlobalKey<FormState> phoneNumberFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // selectedPaymentMethod.value = PaymentMethodModel(
    //   name: 'AirtelMoney',
    //   image: CcImages.airtel,
    // );
    checkUserNumberAndDisplayProvider();

    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CcSizes.lg),
          child: Column(
            children: [
              const CcSectionHeading(
                  title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: CcSizes.spaceBtnSections),
              CcPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Airtel Money',
                  image: CcImages.airtel,
                ),
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
              CcPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Tigo Pesa',
                  image: CcImages.tigo,
                ),
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
              CcPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'M-Pesa',
                  image: CcImages.vodacom,
                ),
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
              CcPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'HaloPesa',
                  image: CcImages.halotel,
                ),
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
              CcPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'T-Pesa',
                  image: CcImages.ttcl,
                ),
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
            ],
          ),
        ),
      ),
    );
  }

  PaymentMethodModel checkUserNumberAndDisplayProvider() {
    final userPhoneNo = userController.user.value.phoneNumber;

    if (userPhoneNo == '') {
      selectedPaymentMethod.value = PaymentMethodModel(
        name: 'Airtel Money',
        image: CcImages.airtel,
      );
    } else {
      switch (userPhoneNo.substring(0, 3)) {
        case '071':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Tigo Pesa',
            image: CcImages.tigo,
          );
        case '077':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Tigo Pesa',
            image: CcImages.tigo,
          );
        case '065':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Tigo Pesa',
            image: CcImages.tigo,
          );
        case '067':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Tigo Pesa',
            image: CcImages.tigo,
          );
        case '078':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Airtel Money',
            image: CcImages.airtel,
          );
        case '079':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Airtel Money',
            image: CcImages.airtel,
          );
        case '068':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Airtel Money',
            image: CcImages.airtel,
          );
        case '069':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'Airtel Money',
            image: CcImages.airtel,
          );
        case '061':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'HaloPesa',
            image: CcImages.halotel,
          );
        case '062':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'HaloPesa',
            image: CcImages.halotel,
          );
        case '074':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'M-Pesa',
            image: CcImages.vodacom,
          );
        case '075':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'M-Pesa',
            image: CcImages.vodacom,
          );
        case '076':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'M-Pesa',
            image: CcImages.vodacom,
          );
        case '073':
          return selectedPaymentMethod.value = PaymentMethodModel(
            name: 'T-Pesa',
            image: CcImages.ttcl,
          );
      }
    }
    return selectedPaymentMethod.value;
  }

  Future<void> checkoutProcessing() async {
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
      if (!phoneNumberFormKey.currentState!.validate()) {
        CcFullScreenLoader.stopLoading();
        return;
      }
    } catch (e) {
      CcFullScreenLoader.stopLoading();
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
