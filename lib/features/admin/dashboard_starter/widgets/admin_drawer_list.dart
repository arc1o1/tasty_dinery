import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/routes/routes.dart';

class AdminDrawerList extends StatelessWidget {
  const AdminDrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    // container
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          // list of the menu items of the drawer

          menuItem(
              "Dashboard",
              Icons.dashboard_rounded,
              () => navigate(0),
              Get.currentRoute == CcRoutes.adminDashboard
                  ? Colors.lightBlue
                  : Colors.transparent,
              Get.currentRoute == CcRoutes.adminDashboard
                  ? Colors.white
                  : Colors.black),
          // menuItem(
          //     "Media",
          //     Icons.image_rounded,
          //     () => navigate(1),
          //     Get.currentRoute == CcRoutes.adminMedia
          //         ? Colors.blue
          //         : Colors.transparent,
          //     Get.currentRoute == CcRoutes.adminMedia
          //         ? Colors.white
          //         : Colors.black),
          // menuItem(
          //     "Banners",
          //     Icons.post_add_rounded,
          //     () => navigate(2),
          //     Get.currentRoute == CcRoutes.adminBanners
          //         ? Colors.blue
          //         : Colors.transparent,
          //     Get.currentRoute == CcRoutes.adminBanners
          //         ? Colors.white
          //         : Colors.black),
          menuItem(
              "Products",
              Icons.shop_2_rounded,
              () => navigate(3),
              Get.currentRoute == CcRoutes.adminProducts
                  ? Colors.blue
                  : Colors.transparent,
              Get.currentRoute == CcRoutes.adminProducts
                  ? Colors.white
                  : Colors.black),
          menuItem(
              "Categories",
              Icons.category_rounded,
              () => navigate(4),
              Get.currentRoute == CcRoutes.adminCategories
                  ? Colors.blue
                  : Colors.transparent,
              Get.currentRoute == CcRoutes.adminCategories
                  ? Colors.white
                  : Colors.black),
          menuItem(
              "Customers",
              Icons.people_rounded,
              () => navigate(5),
              Get.currentRoute == CcRoutes.adminCustomers
                  ? Colors.blue
                  : Colors.transparent,
              Get.currentRoute == CcRoutes.adminCustomers
                  ? Colors.white
                  : Colors.black),
          menuItem(
              "Orders",
              Icons.add_box_rounded,
              () => navigate(6),
              Get.currentRoute == CcRoutes.adminOrders
                  ? Colors.blue
                  : Colors.transparent,
              Get.currentRoute == CcRoutes.adminOrders
                  ? Colors.white
                  : Colors.black),
          menuItem(
              "Settings",
              Icons.settings_rounded,
              () => navigate(7),
              Get.currentRoute == CcRoutes.adminSettings
                  ? Colors.blue
                  : Colors.transparent,
              Get.currentRoute == CcRoutes.adminSettings
                  ? Colors.white
                  : Colors.black),
          // menuItem(
          //     "Logout",
          //     Icons.logout_rounded,
          //     () => navigate(8),
          //     Get.currentRoute == CcRoutes.adminLogout
          //         ? Colors.blue
          //         : Colors.transparent,
          //     Get.currentRoute == CcRoutes.adminLogout
          //         ? Colors.white
          //         : Colors.black),
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon, Function() onTap, Color color,
      Color textColor) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(CcRoutes.adminDashboard);
    } else if (index == 1) {
      Get.toNamed(CcRoutes.adminMedia);
    } else if (index == 2) {
      Get.toNamed(CcRoutes.adminBanners);
    } else if (index == 3) {
      Get.toNamed(CcRoutes.adminProducts);
    } else if (index == 4) {
      Get.toNamed(CcRoutes.adminCategories);
    } else if (index == 5) {
      Get.toNamed(CcRoutes.adminCustomers);
    } else if (index == 6) {
      Get.toNamed(CcRoutes.adminOrders);
    } else if (index == 7) {
      Get.toNamed(CcRoutes.adminSettings);
    } else if (index == 8) {
      Get.toNamed(CcRoutes.adminLogout);
    }
  }
}
