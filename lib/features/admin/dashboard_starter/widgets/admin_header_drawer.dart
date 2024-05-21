import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';

class AdminHeaderDrawer extends StatelessWidget {
  const AdminHeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade700,
      width: double.infinity,
      height: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(CcImages.appLogo),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tasty",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey.shade100, fontSize: 25),
              ),
              const SizedBox(width: 5),
              Text(
                "Dinery",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.yellow, fontSize: 25),
              ),
            ],
          )
        ],
      ),
    );
  }
}
