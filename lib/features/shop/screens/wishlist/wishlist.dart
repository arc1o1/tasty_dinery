import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/icons/circular_icons.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CcAppBar(
        //title
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wishlist', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),

        // icon
        actions: [
          CcCircularIcon(
            icon: Icons.add,
            onPressed: () {},
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CcGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => const CcProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
