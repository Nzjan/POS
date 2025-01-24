import 'package:RMS/view/dashboard/sections/guest_flow_analysis.dart';
import 'package:RMS/view/dashboard/sections/most_ordered_dishes.dart';
import 'package:RMS/view/dashboard/sections/order_type.dart';
import 'package:RMS/view/dashboard/sections/register_status.dart';
import 'package:RMS/view/dashboard/sections/table_status.dart';
import 'package:RMS/view/dashboard/sections/total_sales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:fluent_ui/fluent_ui.dart';

// Sections
import 'sections/order_status.dart';
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
        padding: EdgeInsets.only(left: 24.w, right: 20.w, bottom: 20.h, top: 20.h), // Use responsive padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side Content
            Expanded(
              child: Column(
                children: [
                  // Header Bar

                  // First section: Summary and Overall Sales
                  const SummaryData(),
                  SizedBox(height: 20.h), // Use responsive spacing
                  UpcomingReservations(),
                  SizedBox(height: 20.h),

                  // Flex section for Staff (Left and Right)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MostOrderedDishes(),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: TableStatus(),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Overall Sales repeated (if needed)
                  TotalSalesChart(),
                  SizedBox(height: 20.h),

                  // Another Flex section for Staff (Left and Right)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RegisterStatus(),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: OrderType(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GuestFlowAnalysis(),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            // Right Side Content (Order Status)
            SizedBox(
              width: 418.w, // Use responsive width
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OrderStatus(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
