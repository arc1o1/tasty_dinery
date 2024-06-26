import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:tasty_dinery/features/client/shop/screens/search/search_meal.dart';

class CcHomeAppBar extends StatelessWidget {
  const CcHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // controller instantiation

    // appbar
    return CcAppBar(
      padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
      // title
      title: Text(
        "Home",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white),
      ),
      centerTitle: true,

      // leading image
      showProfile: true,
      imageHeight: 50,
      imageWidth: 50,
      imageBackgroundColor: Colors.blue.shade600,

      // cart icon
      actions: [
        IconButton(
          onPressed: () => Get.to(() => const SearchScreen()),
          icon: const Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
        ),
        const CcCartCounterIcon(
          iconColor: Colors.white,
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
