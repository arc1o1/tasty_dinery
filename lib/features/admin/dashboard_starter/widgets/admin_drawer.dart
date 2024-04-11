import 'package:flutter/material.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_drawer_list.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_header_drawer.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.zero,
          child: const Column(
            children: [
              AdminHeaderDrawer(),
              AdminDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
}
