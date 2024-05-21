import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/material_container.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_dashboard_barchart.dart';
import 'package:tasty_dinery/features/admin/dashboard_starter/widgets/admin_dashboard_piechart.dart';
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
          "Admin Dashboard",
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
              const AdminDashboardBarChart(),

              const SizedBox(height: 20),

              // 02 - pie chart - order status
              const AdminDashboardPieChart(),
            ],
          ),
        ),
      ),
    );
  }
}

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
          subtitle: "300",
          icon: Icons.arrow_circle_up_rounded,
          iconText: "10%",
          comparisonText: "Compared to March 2024",
        ),

        SizedBox(height: CcSizes.spaceBtnItems_2),

        // Visitors
        MaterialContainer(
          title: "Visitors",
          subtitle: "2,500",
          icon: Icons.arrow_circle_up_rounded,
          iconText: "5%",
          comparisonText: "Compared to March 2024",
        ),
      ],
    );
  }
}
