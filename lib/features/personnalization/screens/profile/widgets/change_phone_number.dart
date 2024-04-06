import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/features/personnalization/controllers/update_name_controller.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/validators/validator.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(UpdateNameController());

    // scaffold
    return Scaffold(
      // appbar
      appBar: CcAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          'Change Phone Number',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // padding body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            Text(
              "Use real phone number for proper verification. This number will appear on several pages and transaction process.",
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // textfields and buttons form
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  // phone number
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) =>
                        CcValidator.validatePhoneNumber(value),
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
            const SizedBox(height: CcSizes.spaceBtnSections),

            // save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updatePhoneNumber(),
                child: const Text("save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
