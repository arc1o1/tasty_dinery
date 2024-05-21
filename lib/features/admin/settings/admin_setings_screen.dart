import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/secondary_header_container.dart';
import 'package:tasty_dinery/common/widgets/list_tile/settings_menu_tiles.dart';
import 'package:tasty_dinery/common/widgets/list_tile/user_profile_tile.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_drawer.dart';
import 'package:tasty_dinery/features/client/personnalization/controllers/logout_controller.dart';
import 'package:tasty_dinery/features/client/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/profile/profile_screen.dart';
import 'package:tasty_dinery/features/client/shop/screens/order/order.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // instantiate controller
    final controller = Get.put(LogoutController());
    // ignore: unused_local_variable
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
        ),
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            CcSecondaryHeaderContainer(
              child: Column(
                children: [
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
                    icon: Icons.history,
                    title: 'My Orders',
                    // subtitle: 'In progress and completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
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

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () => controller.logout(),
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
