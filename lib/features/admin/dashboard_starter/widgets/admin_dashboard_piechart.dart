import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminDashboardPieChart extends StatelessWidget {
  const AdminDashboardPieChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade200,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Order Status",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    innerRadius: "70%",
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(fontSize: 9),
                    ),
                  ),
                ],
              ),
            ),

            // data table for order status as a legend
            DataTable(
              dataRowMinHeight: 40,
              showBottomBorder: true,
              columnSpacing: 30,
              columns: const [
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Orders")),
                DataColumn(label: Text("Total")),
              ],
              rows: const [
                // pending orders
                DataRow(
                  cells: [
                    DataCell(Row(children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.blue,
                        size: 15,
                      ),
                      Text("Pending")
                    ])),
                    DataCell(Text("30")),
                    DataCell(Text("400000/=")),
                  ],
                ),

                // served orders
                DataRow(
                  cells: [
                    DataCell(Row(children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.green,
                        size: 15,
                      ),
                      Text("Served")
                    ])),
                    DataCell(Text("20")),
                    DataCell(Text("200000/=")),
                  ],
                ),

                // orders waiting for payment processing
                DataRow(
                  cells: [
                    DataCell(Row(children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.purple,
                        size: 15,
                      ),
                      Text("Processing")
                    ])),
                    DataCell(Text("30")),
                    DataCell(Text("250000/=")),
                  ],
                ),

                // cancelled orders
                DataRow(
                  cells: [
                    DataCell(Row(children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.red,
                        size: 15,
                      ),
                      Text("Canceled")
                    ])),
                    DataCell(Text("20")),
                    DataCell(Text("200000/=")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<ChartData> chartData = [
  ChartData("Served", 20, Colors.green),
  ChartData("Processing", 30, Colors.purple),
  ChartData("Canceled", 20, Colors.red),
  ChartData("Pending", 30, Colors.blue),
];

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
