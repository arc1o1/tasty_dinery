import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/features/client/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/settings/settings.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/devices/device_utility.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';

class CcAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CcAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.leading,
    this.centerTitle = false,
    this.showProfile = false,
    this.imageString,
    this.imageWidth = 50,
    this.imageHeight = 50,
    this.imagePadding = 0,
    this.isNetworkImage = false,
    this.padding = const EdgeInsets.only(left: 10, right: 5),
    this.imageBackgroundColor,
  });

  final Widget? title;
  final bool showBackArrow, centerTitle, showProfile, isNetworkImage;
  final IconData? leadingIcon;
  final List<Widget>? leading;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final double? imageWidth, imageHeight, imagePadding;
  final EdgeInsets padding;
  final String? imageString;
  final Color? imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    // controller instantiation
    final controller = Get.put(UserController());

    // padding
    return Padding(
      padding: padding,
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              )
            : showProfile
                ? Obx(
                    () {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : CcImages.user2;

                      return controller.imageUploading.value
                          ? const CcShimmerEffect(
                              width: 100, height: 100, radius: 100)
                          : GestureDetector(
                              onTap: () => Get.to(() => const SettingsScreen()),
                              child: CcCircularImage(
                                image: image,
                                width: 50,
                                height: 50,
                                isNetworkImage: networkImage.isNotEmpty,
                                backgroundColor: imageBackgroundColor,
                              ),
                            );
                    },
                  )
                : IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  ),
        title: title,
        centerTitle: centerTitle,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CcDeviceUtils.getAppBarHeight());
}
