import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/features/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';
// import 'package:tasty_dinery/utils/constants/image_strings.dart';

class CcUserProfileTile extends StatelessWidget {
  const CcUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = UserController.instance;

    //list tile
    return ListTile(
      leading: Obx(
        () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : CcImages.user2;

          return controller.imageUploading.value
              ? const CcShimmerEffect(width: 100, height: 100, radius: 100)
              : CcCircularImage(
                  image: image,
                  width: 50,
                  height: 50,
                  isNetworkImage: networkImage.isNotEmpty,
                  backgroundColor: Colors.blue.shade600,
                );
        },
      ),
      title: Text(controller.user.value.firstName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: CcColors.white)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: CcColors.white)),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit4, color: Colors.white),
      ),
    );
  }
}
