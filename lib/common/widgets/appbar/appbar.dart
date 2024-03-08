import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/features/personnalization/screens/settings/settings.dart';
import 'package:tasty_dinery/utils/devices/device_utility.dart';

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
                ? GestureDetector(
                    onTap: () => Get.to(() => const SettingsScreen()),
                    child: CcCircularImage(
                      image: imageString!,
                      width: imageWidth!,
                      height: imageHeight!,
                      padding: imagePadding!,
                      backgroundColor: imageBackgroundColor,
                    ),
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
