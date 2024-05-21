import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_drawer.dart';
import 'package:tasty_dinery/features/admin/shop/orders/widgets/admin_table_filter.dart';
import 'package:tasty_dinery/features/admin/users/customers/admin_customer_detail_information.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminCustomers extends StatelessWidget {
  const AdminCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Customers",
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
                    "dashboard/customers",
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
                      labelText: "Search Customer",
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
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    // space
                    const SizedBox(height: CcSizes.spaceBtnItems_1),

                    // table
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(
                            Colors.grey.withOpacity(0.3)),

                        columnSpacing: 25,

                        columns: [
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        size: 18),
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("Customer"),
                                ],
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Email"),
                                ],
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Phone Number"),
                                ],
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Reg. At"),
                                ],
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Action"),
                                ],
                              ),
                            ),
                          ),
                        ],

                        // rows
                        rows: [
                          for (int i = 0; i < 10; i++)
                            DataRow(
                              color: MaterialStateProperty.resolveWith(
                                  (states) => Colors.grey.shade200),
                              cells: [
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            size: 18),
                                      ),
                                      const SizedBox(width: 3),
                                      InkWell(
                                        onTap: () => Get.to(() =>
                                            const AdminCustomerDetailInformation()),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: 70,
                                          child: Text(
                                            "Alphonce Alfred",
                                            softWrap: true,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(fontSize: 13),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Container(
                                      color: Colors.transparent,
                                      width: 70,
                                      child: Text(
                                        "alphoncealfred@gmail.com",
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(fontSize: 13),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      "0610203040",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      "24th Mar 2024",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 20,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(
                                          width: CcSizes.spaceBtnItems_2),
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(Icons.delete,
                                            size: 20, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),

                    const Divider(),

                    const SizedBox(height: CcSizes.spaceBtnItems_1),

                    // make this the same as what we did in add new category section
                    const AdminTableFilter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
