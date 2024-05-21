import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/admin/shop/orders/admin_order_detail_screen.dart';

class AdminOrderTable extends StatelessWidget {
  const AdminOrderTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 20,
      // border: TableBorder(borderRadius: BorderRadius.circular(10)),
      headingRowColor: MaterialStateProperty.resolveWith(
          (states) => Colors.grey.withOpacity(0.2)),

      // columns
      columns: const [
        DataColumn(
          label: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check_box_outline_blank_rounded, size: 18),
                SizedBox(width: 3),
                Text("Order ID"),
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
                Text("Status"),
              ],
            ),
          ),
        ),
      ],

      // rows
      rows: [
        DataRow(
          color: MaterialStateProperty.resolveWith(
              (states) => Colors.grey.shade200),
          cells: [
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.check_box_outline_blank_rounded, size: 18),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => Get.to(() => const AdminOrderDetailScreen()),
                    child: Text(
                      "[#6ce45]",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            DataCell(Text(
              "25 Mar 2024",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12),
            )),
            DataCell(
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Pending",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.lightBlue, fontSize: 14),
                  ),
                ),
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
                  const Icon(Icons.check_box_outline_blank_rounded, size: 18),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => Get.to(() => const AdminOrderDetailScreen()),
                    child: Text(
                      "[#6ce45]",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            DataCell(Text(
              "25 Mar 2024",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12),
            )),
            DataCell(
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Served",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.green, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),

        // third row
        DataRow(
          color: MaterialStateProperty.resolveWith(
              (states) => Colors.grey.shade200),
          cells: [
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.check_box_outline_blank_rounded, size: 18),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => Get.to(() => const AdminOrderDetailScreen()),
                    child: Text(
                      "[#6ce45]",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            DataCell(Text(
              "25 Mar 2024",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12),
            )),
            DataCell(
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Cancelled",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.redAccent, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),

        // fourth row
        DataRow(
          color: MaterialStateProperty.resolveWith(
              (states) => Colors.grey.shade200),
          cells: [
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.check_box_outline_blank_rounded, size: 18),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => Get.to(() => const AdminOrderDetailScreen()),
                    child: Text(
                      "[#6ce45]",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            DataCell(Text(
              "25 Mar 2024",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12),
            )),
            DataCell(
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Processing",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.lightBlue, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
