import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_drawer.dart';
import 'package:tasty_dinery/features/admin/shop/categories/admin_add_category_screen.dart';
import 'package:tasty_dinery/features/admin/shop/orders/widgets/admin_table_filter.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class AdminCategories extends StatelessWidget {
  const AdminCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Categories",
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
                    "dashboard/categories",
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
                      labelText: "Search Category",
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
                    Center(
                      child: SizedBox(
                        width: CcHelperFunctions.screenWidth() / 2,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const AdminAddCategory()),
                          child: const Text("Add Category"),
                        ),
                      ),
                    ),

                    const SizedBox(height: CcSizes.spaceBtnItems_1),

                    // table
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(
                            Colors.grey.withOpacity(0.3)),

                        columnSpacing: 25,

                        columns: const [
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.check_box_outline_blank_rounded,
                                      size: 18),
                                  SizedBox(width: 3),
                                  Text("Category"),
                                ],
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Parent Category"),
                                ],
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Featured"),
                                ],
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Date"),
                                ],
                              ),
                            ),
                          ),
                          DataColumn(
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
                          for (int i = 0; i < 5; i++)
                            // first row
                            DataRow(
                              color: MaterialStateProperty.resolveWith(
                                  (states) => Colors.grey.shade200),
                              cells: [
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                          Icons.check_box_outline_blank_rounded,
                                          size: 18),
                                      const SizedBox(width: 3),
                                      Container(
                                        color: Colors.transparent,
                                        width: 70,
                                        child: Text(
                                          "Breakfast",
                                          softWrap: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                      child: Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.blue,
                                    size: 20,
                                  )),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                      "",
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
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(Icons.edit,
                                            size: 20, color: Colors.blue),
                                      ),
                                      const SizedBox(
                                          width: CcSizes.spaceBtnItems_2),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(Icons.delete,
                                            size: 20, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          // second row
                          DataRow(
                            color: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.shade200),
                            cells: [
                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        size: 18),
                                    const SizedBox(width: 3),
                                    Container(
                                      color: Colors.transparent,
                                      width: 70,
                                      child: Text(
                                        "Bites",
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(fontSize: 13),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(
                                    "Breakfast",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                              const DataCell(
                                Center(
                                    child: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.blue,
                                  size: 20,
                                )),
                              ),
                              DataCell(
                                Center(
                                  child: Text(
                                    "20 Mar 2024",
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
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Icon(Icons.edit,
                                          size: 20, color: Colors.blue),
                                    ),
                                    const SizedBox(
                                        width: CcSizes.spaceBtnItems_2),
                                    GestureDetector(
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
