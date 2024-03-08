import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/images/circular_profile_image.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/personnalization/screens/profile/widgets/profile_menu.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      appBar: const CcAppBar(
        title: Text('Profile'),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CcCircularProfileImage(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        image: CcImages.user2,
                        width: 150,
                        height: 150,
                        padding: 20),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              // divider
              const SizedBox(height: CcSizes.spaceBtnItems_2 / 2),
              const Divider(),
              const SizedBox(height: CcSizes.spaceBtnItems_2),

              // section heading
              const CcSectionHeading(
                  title: "Profile Information", showActionButton: false),

              const SizedBox(height: CcSizes.spaceBtnItems_2),

              // user details
              CcProfileMenu(onPressed: () {}, title: "Name:", value: "Mwesiga"),
              CcProfileMenu(
                  onPressed: () {}, title: "Username:", value: "Mwesiga"),

              const SizedBox(height: CcSizes.spaceBtnItems_2),
              const Divider(),
              const SizedBox(height: CcSizes.spaceBtnItems_2),

              // section heading
              const CcSectionHeading(
                  title: "Personal Information", showActionButton: false),

              const SizedBox(height: CcSizes.spaceBtnItems_2),

              // personal information
              CcProfileMenu(
                  onPressed: () {},
                  title: "User ID:",
                  value: "14146",
                  icon: Icons.copy),
              CcProfileMenu(
                  onPressed: () {},
                  title: "E-mail:",
                  value: "tegs123@gmail.com.com"),
              CcProfileMenu(
                  onPressed: () {},
                  title: "Phone Number:",
                  value: "0621210210"),
            ],
          ),
        ),
      ),
    );
  }
}
