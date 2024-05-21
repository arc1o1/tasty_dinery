import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/client/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/profile/widgets/change_name.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/profile/widgets/change_phone_number.dart';
import 'package:tasty_dinery/features/client/personnalization/screens/profile/widgets/profile_menu.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = UserController.instance; 

    // scaffold
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
                width: 200,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : CcImages.user2;
                        return controller.imageUploading.value
                            ? const CcShimmerEffect(
                                width: 100, height: 100, radius: 100)
                            : CcCircularImage(
                                backgroundColor: Colors.blue.shade600,
                                image: image,
                                width: 100,
                                height: 100,
                                isNetworkImage: networkImage.isNotEmpty);
                      },
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
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
              CcProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: "Name:",
                  value: controller.user.value.fullName),
              CcProfileMenu(
                  onPressed: () {},
                  title: "Username:",
                  value: controller.user.value.firstName),

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
                  value: controller.user.value.id,
                  icon: Icons.copy),
              CcProfileMenu(
                  onPressed: () {},
                  title: "E-mail:",
                  value: controller.user.value.email),
              CcProfileMenu(
                  onPressed: () => Get.to(() => const ChangePhoneNumber()),
                  title: "Phone Number:",
                  value: controller.user.value.phoneNumber),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              const Divider(color: Colors.grey),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
