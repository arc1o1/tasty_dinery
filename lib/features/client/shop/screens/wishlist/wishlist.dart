import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/icons/circular_icons.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/loaders/animation_loader_sizeable.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/common/widgets/shimmer/horizontal_shimmer.dart';
import 'package:tasty_dinery/features/client/shop/controllers/favorites_controller.dart';
import 'package:tasty_dinery/navigation_menu.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/cloud_helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(FavoritesController());

    // scaffold
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
              Obx(
                () => FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      // nothing found widget
                      final emptyWidget = CcAnimationLoaderWidgetSizeable(
                        width: MediaQuery.of(context).size.width * 0.5,
                        text: 'Whoops! Wishlist is empty...',
                        animation: CcImages.pencilLoading,
                        showAction: true,
                        actionText: "Let's add some",
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );

                      const loader = CcHorizontalProductShimmer(itemCount: 6);
                      final widget =
                          CcCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return CcGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => CcProductCardVertical(
                                product: products[index],
                              ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
