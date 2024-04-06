import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/features/shop/controllers/product_checkout_controller.dart';
import 'package:tasty_dinery/features/shop/models/payment_method_model.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcPaymentTile extends StatelessWidget {
  const CcPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = CheckOutController.instance;

    // list tile
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: CcRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: Colors.grey.withOpacity(0.2),
        padding: const EdgeInsets.all(CcSizes.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
