import 'package:RMS/pages/dashboard/sections/guest_flow_analysis.dart';
import 'package:RMS/pages/dashboard/sections/most_ordered_dishes.dart';
import 'package:RMS/pages/dashboard/sections/order_type.dart';
import 'package:RMS/pages/dashboard/sections/register_status.dart';
import 'package:RMS/pages/dashboard/sections/table_status.dart';
import 'package:RMS/pages/dashboard/sections/total_sales.dart';
import 'package:fluent_ui/fluent_ui.dart';

// Sections
import 'sections/order_status/order_status.dart';
import 'sections/upcoming_reservation.dart';

import 'sections/summary_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isDrawerExpanded = false; // Tracks the drawer state (collapsed/expanded).
  int selectedPageIndex = 0; // Tracks the selected page index.
  bool isSelectedHeader = false;


  void toggleDrawer() {
    setState(() {
      isDrawerExpanded = !isDrawerExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffecf0f3),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 94, right: 20, bottom: 20, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Column(
                children: [
                  //Header Bar

                  // First section: Summary and Overall Sales
                  SummaryData(),
                  const SizedBox(height: 20),
                  UpcomingReservations(),
                  const SizedBox(height: 20),

                  // Flex section for Staff (Left and Right)
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MostOrderedDishes(),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TableStatus(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Overall Sales repeated (if needed)
                  TotalSalesChart(),
                  const SizedBox(height: 20),

                  // Another Flex section for Staff (Left and Right)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RegisterStatus(),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OrderType(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GuestFlowAnalysis(),
                ],
              ),
            ),
            const SizedBox(width: 20,),
            const SizedBox(
              width: 418,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OrderStatus()
                  ],
                )
            )
          ],
        )
      ),
    );
  }
}
