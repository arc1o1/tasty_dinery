import 'package:flutter/material.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_drawer.dart';
import 'package:tasty_dinery/features/admin/shop/orders/widgets/admin_order_table.dart';
import 'package:tasty_dinery/features/admin/shop/orders/widgets/admin_table_filter.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminOrders extends StatelessWidget {
  const AdminOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Orders",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
        ),
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "dashboard/orders",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // search bar
              Material(
                elevation: 5,
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 85,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (search) {},
                    decoration: InputDecoration(
                      labelText: "Search Orders",
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              Material(
                elevation: 5,
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Orders",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.grey,
                                  fontSize: 23,
                                ),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_2 * 2),

                      // order table
                      const AdminOrderTable(),

                      const SizedBox(height: CcSizes.spaceBtnSections * 2),

                      // table filter
                      const AdminTableFilter(),

                      const SizedBox(height: CcSizes.spaceBtnItems_2),
                    ],
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
