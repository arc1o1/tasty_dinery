import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_checkout_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_order_controller.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/validators/validator.dart';

class CcBillingPaymentMethodSection extends StatelessWidget {
  const CcBillingPaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(CheckOutController());
    final orderController = Get.put(OrderController());

    // column
    return Column(
      children: [
        CcSectionHeading(
            title: "Payment Method",
            buttonTitle: "Change",
            onPressed: () => controller.selectPaymentMethod(context)),

        // const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Row(
                children: [
                  CcRoundedContainer(
                    width: 60,
                    height: 40,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.all(CcSizes.sm),
                    child: Image(
                      image: AssetImage(
                          controller.selectedPaymentMethod.value.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: CcSizes.spaceBtnItems_2),
                  Text(controller.selectedPaymentMethod.value.name,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

        Column(
          children: [
            // heading
            const CcSectionHeading(
              title: "Payment Number",
              showActionButton: false,
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1 * 1.5),

            // phone number
            Form(
              key: orderController.phoneNoFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: orderController.phoneNumber,
                    validator: (value) =>
                        CcValidator.validatePaymentMethodWithPhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: CcTexts.phoneNo,
                      prefixIcon: Icon(
                        Icons.smartphone_rounded,
                      ),
                    ),
                    expands: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1),
          ],
        )
      ],
    );
  }
}
