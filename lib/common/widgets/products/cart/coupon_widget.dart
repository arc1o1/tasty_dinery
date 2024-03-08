import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcCouponCode extends StatelessWidget {
  const CcCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CcRoundedContainer(
      showBorder: true,
      borderColor: Colors.grey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(CcSizes.sm),
      child: Row(
        children: [
          // textfield
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here!",
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          // button
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // textStyle: TextStyle(backgroundColor: Colors.black),
                foregroundColor: CcColors.dark,
                backgroundColor: Colors.grey.withOpacity(0.3),
                elevation: 0,
                side: BorderSide(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              child: const Text("Apply"),
            ),
          )
        ],
      ),
    );
  }
}
