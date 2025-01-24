import 'package:fluent_ui/fluent_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class OrderType extends StatefulWidget {
  @override
  _OrderTypeState createState() => _OrderTypeState();
}

class _OrderTypeState extends State<OrderType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204.h, // Make the container height responsive
      padding: EdgeInsets.all(16.w), // Make the padding responsive
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r), // Make border radius responsive
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r, // Make blur radius responsive
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white, // Background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Type',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp, // Make font size responsive
                  color: const Color(0xff333333),
                ),
              ),
              DropDownButton(
                items: [
                  MenuFlyoutItem(
                    text: const Text('Today'),
                    onPressed: () {},
                  ),
                  MenuFlyoutItem(
                    text: const Text('This Week'),
                    onPressed: () {},
                  ),
                  MenuFlyoutItem(
                    text: const Text('This Month'),
                    onPressed: () {},
                  ),
                ],
                leading: const Text('Today'),
              ),
            ],
          ),

          SizedBox(height: 16.h), // Make spacing responsive

          // Donut chart and legend
          Expanded(
            child: Row(
              children: [
                // Donut chart
                Flexible(
                  flex: 1,
                  child: PieChart(
                    PieChartData(
                      sections: _getPieChartData(),
                      sectionsSpace: 4.w, // Responsive space between sections
                      centerSpaceRadius: 40.w, // Responsive center space radius
                    ),
                  ),
                ),
                SizedBox(width: 16.w), // Responsive spacing between chart and legend

                // Legend
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem(
                        color: const Color(0xff7690C7),
                        label: 'Dine-in',
                        percentage: '70%',
                      ),
                      SizedBox(height: 8.h), // Make spacing responsive
                      _buildLegendItem(
                        color: const Color(0xffFE8155),
                        label: 'Take away',
                        percentage: '20%',
                      ),
                      SizedBox(height: 8.h), // Make spacing responsive
                      _buildLegendItem(
                        color: const Color(0xffCFD8DC),
                        label: 'Delivery',
                        percentage: '10%',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _getPieChartData() {
    return [
      PieChartSectionData(
        value: 70,
        color: const Color(0xff7690C7),
        title: '',
        radius: 30.r, // Make radius responsive
      ),
      PieChartSectionData(
        value: 20,
        color: const Color(0xffFE8155),
        title: '',
        radius: 30.r, // Make radius responsive
      ),
      PieChartSectionData(
        value: 10,
        color: const Color(0xffCFD8DC),
        title: '',
        radius: 30.r, // Make radius responsive
      ),
    ];
  }

  Widget _buildLegendItem({required Color color, required String label, required String percentage}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6.w, // Make avatar radius responsive
          backgroundColor: color,
        ),
        SizedBox(width: 8.w), // Make spacing responsive
        Text(
          label,
          style: FluentTheme.of(context).typography.body,
        ),
        const Spacer(),
        Text(
          percentage,
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
      ],
    );
  }
}
