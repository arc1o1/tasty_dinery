import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/devices/device_utility.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CcTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? CcColors.black : Colors.grey.shade300,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        dividerColor: dark ? Colors.white : Colors.grey.withOpacity(0.2),
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CcColors.primary,
        labelColor: dark ? CcColors.white : CcColors.primary,
        unselectedLabelColor: CcColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CcDeviceUtils.getAppBarHeight());
}
