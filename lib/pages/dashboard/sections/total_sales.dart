import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:fluent_ui/fluent_ui.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalSalesChart extends StatefulWidget {
  @override
  _TotalSalesChartState createState() => _TotalSalesChartState();
}

class _TotalSalesChartState extends State<TotalSalesChart> {
  String selectedTimePeriod = "last 12 days";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h, // Responsive height using ScreenUtil
      padding: EdgeInsets.all(16.w), // Responsive padding using ScreenUtil
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Responsive border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r, // Responsive blur radius
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Sales',
                style: TextStyle(
                  fontSize: 20.sp, // Responsive font size
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3e3e3e),
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
          SizedBox(height: 16.h), // Responsive height using ScreenUtil
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 20.w,
                  verticalInterval: 1.h,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xffe0e0e0),
                      strokeWidth: 1.w, // Responsive stroke width
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xffe0e0e0),
                      strokeWidth: 1.w, // Responsive stroke width
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xffe0e0e0), width: 1.w), // Responsive border width
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40.w, // Responsive reserved size
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()} k',
                          style: TextStyle(
                            color: const Color(0xffaaaaaa),
                            fontSize: 10.sp, // Responsive font size
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const labels = ['1 Dec', '3 Dec', '5 Dec', '7 Dec', '9 Dec', '11 Dec'];
                        if (value.toInt() >= 0 && value.toInt() < labels.length) {
                          return Text(
                            labels[value.toInt()],
                            style: TextStyle(
                              color: const Color(0xffaaaaaa),
                              fontSize: 10.sp, // Responsive font size
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 60),
                      const FlSpot(1, 20),
                      const FlSpot(2, 40),
                      const FlSpot(3, 80),
                      const FlSpot(4, 50),
                      const FlSpot(5, 90),
                    ],
                    isCurved: false,
                    color: const Color(0xFF7086FD),
                    barWidth: 4.w, // Responsive bar width
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF9A70FD).withOpacity(0.3),
                          const Color(0xFF9A70FD).withOpacity(0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: const FlDotData(
                      show: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
