import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CcAppBar(
        title: Text("Popular Products"),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // filter bar
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {},
                items: [
                  "Name",
                  "Higher Price",
                  "Lower Price",
                  "Sale",
                  "Newest",
                  "Popularity",
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),

              const SizedBox(height: CcSizes.spaceBtnSections),

              CcGridLayout(
                itemCount: 5,
                itemBuilder: (_, index) => const CcProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
