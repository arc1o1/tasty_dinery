import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/success_screen/success.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/data/repositories/order/order_repository.dart';
import 'package:tasty_dinery/features/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/shop/controllers/product_checkout_controller.dart';
import 'package:tasty_dinery/features/shop/models/order_model.dart';
import 'package:tasty_dinery/features/shop/screens/order/order.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/network_manager.dart';
import 'package:tasty_dinery/utils/popups/full_screen_loader.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // variables
  final cartController = CartController.instance;
  final checkoutController = Get.put(CheckOutController());

  final orderRepository = Get.put(OrderRepository());

  final userController = UserController.instance;
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> phoneNoFormKey = GlobalKey<FormState>();

  // fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      CcLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  // add methods for order processing
  // add payment number param
  void processOrder(double totalAmount) async {
    try {
      // start loader
      CcFullScreenLoader.openLoadingDialog(
          'Processing your Order', CcImages.clockLoadingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      if (!phoneNoFormKey.currentState!.validate()) {
        CcFullScreenLoader.stopLoading();
        return;
      }

      // get user authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // add details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        paymentNumber: phoneNumber.value.text,
        servedDate: null,
        items: cartController.cartItems.toList(),
      );

      // save order to firestore
      await orderRepository.saveOrder(order, userId);

      // update cart status
      cartController.clearCart();

      // call a transaction method before showing a success screen
      // have to find a payment gateway

      // show success screen
      Get.off(() => SuccessOverlay(
            title: 'Payment Sucess',
            subtitle:
                'Your meal will be ready by the time you reach the cafeteria',
            image: CcImages.tick,
            onPressed: () => Get.offAll(() => const OrderScreen()),
          ));
    } catch (e) {
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}