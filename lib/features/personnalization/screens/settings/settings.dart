import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/secondary_header_container.dart';
import 'package:tasty_dinery/common/widgets/list_tile/settings_menu_tiles.dart';
import 'package:tasty_dinery/common/widgets/list_tile/user_profile_tile.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/personnalization/screens/profile/profile_screen.dart';
import 'package:tasty_dinery/features/shop/screens/cart/cart.dart';
import 'package:tasty_dinery/features/shop/screens/order/order.dart';
import 'package:tasty_dinery/features/shop/screens/payment_method_screen/payment_method_screen.dart';
import 'package:tasty_dinery/features/shop/screens/wishlist/wishlist.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            CcSecondaryHeaderContainer(
              child: Column(
                children: [
                  CcAppBar(
                    centerTitle: true,
                    title: Text('Account Settings',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: CcColors.white)),
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_2 / 2),

                  // user profile card
                  CcUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),

                  const SizedBox(height: CcSizes.spaceBtnSections),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // account setting
                  const CcSectionHeading(
                      title: 'Account Settings', showActionButton: false),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  CcSettingsMenuTile(
                    icon: Icons.favorite,
                    title: 'Favorites',
                    onTap: () => Get.to(() => const FavoriteScreen()),
                  ),
                  CcSettingsMenuTile(
                    icon: Icons.shopping_cart_checkout_outlined,
                    title: 'Cart',
                    // subtitle: 'Add or remove meals, and move to checkout ',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  CcSettingsMenuTile(
                    icon: Icons.history,
                    title: 'My Orders',
                    // subtitle: 'In progress and completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  CcSettingsMenuTile(
                    icon: Icons.account_box_outlined,
                    title: 'Payment Method',
                    // subtitle: 'Withdraw balance to a registered payment method',
                    onTap: () => Get.to(() => const PaymentMethodScreen()),
                  ),
                  CcSettingsMenuTile(
                    icon: Icons.discount_outlined,
                    title: 'Coupons',
                    // subtitle: 'List of all discounted meals',
                    onTap: () {},
                  ),
                  CcSettingsMenuTile(
                    icon: Icons.notifications_active_outlined,
                    title: 'Notifications',
                    // subtitle: 'Set any kind of Notification message',
                    onTap: () {},
                  ),
                  CcSettingsMenuTile(
                    icon: Icons.security_outlined,
                    title: 'Privacy',
                    // subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // // app settings
                  // const CcSectionHeading(
                  //     title: 'App Settings', showActionButton: false),

                  // const SizedBox(height: CcSizes.spaceBtnItems_1),

                  const Divider(),

                  const SizedBox(height: CcSizes.spaceBtnSections),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
