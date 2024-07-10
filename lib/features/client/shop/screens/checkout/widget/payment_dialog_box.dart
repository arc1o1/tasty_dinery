import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/utils/devices/device_utility.dart';

import '../../../../../../utils/validators/validator.dart';
import '../../../controllers/product_checkout_controller.dart';
import '../../../controllers/product_order_controller.dart';

class PaymentDialogBox extends StatelessWidget {
  const PaymentDialogBox({super.key, required this.totalAmount});
  
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    final orderController = Get.put(OrderController());

    return AlertDialog(
      backgroundColor: Colors.grey.shade400,
      content: Container(
        height: CcDeviceUtils.getScreenHeight() / 4.7,
        width: CcDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Text(
              "Ingiza namba ya siri kuthibitisha malipo kwenda kampuni namba 001001, TASTY DINERY.\nKiasi Tshs $totalAmount. Jumla ya makato Tshs 0.00",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15),
            ),

            const SizedBox(height: 10),

            // get user input
            Form(
              key: orderController.pinNoFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: orderController.pin,
                    validator: (value) =>
                        CcValidator.validatePin(value),
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    expands: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            //  buttons : cancel + send
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // cancel button
                SizedBox(
                  width: CcDeviceUtils.getScreenWidth(context) / 3,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: Text(
                      "Cancel",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                ),

                //  save button
                SizedBox(
                  width: CcDeviceUtils.getScreenWidth(context) / 3,
                  child: ElevatedButton(
                    onPressed: () => orderController.processOrder(totalAmount),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600),
                    child: Text(
                      "Send",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
