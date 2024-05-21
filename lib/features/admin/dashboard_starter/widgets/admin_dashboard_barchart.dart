import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_dashboard_piechart.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminDashboardBarChart extends StatelessWidget {
  const AdminDashboardBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('Mon', 540000, Colors.lightBlue),
      ChartData('Tue', 500000, Colors.lightBlue),
      ChartData('Wed', 410000, Colors.lightBlue),
      ChartData('Thu', 350000, Colors.lightBlue),
      ChartData('Fri', 500000, Colors.lightBlue),
      ChartData('Sat', 200000, Colors.lightBlue),
      ChartData('Sun', 150000, Colors.lightBlue),
    ];

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.shade200,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 400,
        width: 320,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Weekly Sales",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: CcSizes.spaceBtnItems_2),
            SfCartesianChart(
              tooltipBehavior: TooltipBehavior(
                  enable: true, tooltipPosition: TooltipPosition.pointer),
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              primaryYAxis: const NumericAxis(
                // majorGridLines: MajorGridLines(width: 0),
                labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              series: <ColumnSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                  enableTooltip: true,
                  spacing: 0.5,
                  width: 0.9,
                  animationDuration: 2000,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(3),
                    topRight: Radius.circular(3),
                  ),
                  // Binding the chartData to the dataSource of the column series.
                  dataSource: chartData,
                  xValueMapper: (ChartData sales, _) => sales.x,
                  yValueMapper: (ChartData sales, _) => sales.y,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
