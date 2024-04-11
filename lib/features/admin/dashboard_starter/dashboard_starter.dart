import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/material_container.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_drawer.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminDashboardStarter extends StatelessWidget {
  const AdminDashboardStarter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Welcome Admin",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // introduction header
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lets Get You Started ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Admin! ",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // some introduction about the dashboard complete
              const AdminDashboardSummary(),

              const SizedBox(height: 20),

              // graph
              // 01 - bar chart weekly sales

              // 02 - pie chart - order status
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Order Status",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold)),
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
                    DataTable(columns: [
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Orders")),
                      DataColumn(label: Text("Total")),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text("Pending")),
                      ])
                    ])
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

// 01
// admin dashboard summary
class AdminDashboardSummary extends StatelessWidget {
  const AdminDashboardSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // total sales
        MaterialContainer(
          title: "Total Sales",
          subtitle: "3000000/= Tshs",
          icon: Icons.arrow_circle_up_rounded,
          iconText: "25%",
          comparisonText: "Compared to March 2024",
        ),

        SizedBox(height: CcSizes.spaceBtnItems_2),

        // average order value
        MaterialContainer(
          title: "Average Order Value",
          subtitle: "10000/= Tshs",
          icon: Icons.arrow_circle_down_rounded,
          color: Colors.redAccent,
          iconText: "5%",
          comparisonText: "Compared to March 2024",
        ),

        SizedBox(height: CcSizes.spaceBtnItems_2),

        // total orders
        MaterialContainer(
          title: "Total Orders",
          subtitle: "300/=",
          icon: Icons.arrow_circle_up_rounded,
          iconText: "10%",
          comparisonText: "Compared to March 2024",
        ),

        SizedBox(height: CcSizes.spaceBtnItems_2),

        // Visitors
        MaterialContainer(
          title: "Total Sales",
          subtitle: "2,500",
          icon: Icons.arrow_circle_up_rounded,
          iconText: "5%",
          comparisonText: "Compared to March 2024",
        ),
      ],
    );
  }
}

// 02 - pie chart list
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
