import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class CcLoginHeader extends StatelessWidget {
  const CcLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 150,
            width: 150,
            child: Image(
              image: AssetImage(CcImages.appLogo),
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tasty',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 30),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Dinery',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: CcColors.black, fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
