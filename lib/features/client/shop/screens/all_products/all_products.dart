import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/shimmer/horizontal_shimmer.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_all_products_controller.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/features/client/shop/screens/all_products/widgets/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    // scaffold
    return Scaffold(
      appBar: CcAppBar(
        title: Text(title),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // check the state of the future builder snapshot
                const loader = CcHorizontalProductShimmer();

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }

                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Data Found'));
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong.'));
                }

                /*
                // You can use the following instead of if's above

                final widget = CcCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                if (widget != null) return widget;

                */

                // product found
                final products = snapshot.data!;

                return CcSortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
