import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/features/client/personnalization/controllers/update_name_controller.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
import 'package:tasty_dinery/utils/validators/validator.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(UpdateNameController());

    // scaffold
    return Scaffold(
      // appbar
      appBar: CcAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
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
              "Use real name for easy verification. This name will appear on several pages.",
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // textfields and buttons form
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  // first name
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        CcValidator.validateEmptyText('First name', value),
                    decoration: const InputDecoration(
                      labelText: CcTexts.firstName,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                      ),
                    ),
                    expands: false,
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // last name
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        CcValidator.validateEmptyText('Last name', value),
                    decoration: const InputDecoration(
                      labelText: CcTexts.firstName,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                      ),
                    ),
                    expands: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnSections),

            // saave button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text("save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
