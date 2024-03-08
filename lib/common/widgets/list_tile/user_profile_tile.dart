import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';

class CcUserProfileTile extends StatelessWidget {
  const CcUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CcCircularImage(
        image: CcImages.user2,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Mwesiga',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: CcColors.white)),
      subtitle: Text('tegs123@gmail.com',
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
