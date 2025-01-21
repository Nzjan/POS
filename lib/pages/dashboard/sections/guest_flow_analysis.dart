import 'package:fluent_ui/fluent_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class GuestFlowAnalysis extends StatefulWidget {
  @override
  _GuestFlowAnalysisState createState() => _GuestFlowAnalysisState();
}

class _GuestFlowAnalysisState extends State<GuestFlowAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 393.h, // Make height responsive
      padding: EdgeInsets.all(16.w), // Make padding responsive
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Make border radius responsive
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r, // Make blur radius responsive
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
                'Guest Flow Analysis',
                style: TextStyle(
                  fontSize: 21.sp, // Make font size responsive
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3e3e3e),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle View All action
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: const Color(0xffaaaaaa), width: 1.w)), // Responsive border width
                  ),
                  child: Text(
                    'More',
                    style: TextStyle(
                      fontSize: 10.sp, // Make font size responsive
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffaaaaaa),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h), // Make spacing responsive
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xffaaaaaa), width: 1.w), // Responsive border width
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.w, // Make reserved size responsive
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: const Color(0xffaaaaaa),
                            fontSize: 10.sp, // Make font size responsive
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text('10:00', style: TextStyle(color: const Color(0xffaaaaaa), fontSize: 10.sp));
                          case 1:
                            return Text('11:00', style: TextStyle(color: const Color(0xffaaaaaa), fontSize: 10.sp));
                          case 2:
                            return Text('12:00', style: TextStyle(color: const Color(0xffaaaaaa), fontSize: 10.sp));
                          case 3:
                            return Text('1:00', style: TextStyle(color: const Color(0xffaaaaaa), fontSize: 10.sp));
                          case 4:
                            return Text('3:00', style: TextStyle(color: const Color(0xffaaaaaa), fontSize: 10.sp));
                          case 5:
                            return Text('5:00', style: TextStyle(color: const Color(0xffaaaaaa), fontSize: 10.sp));
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 36),
                      FlSpot(1, 55),
                      FlSpot(2, 70),
                      FlSpot(3, 45),
                      FlSpot(4, 82),
                      FlSpot(5, 60),
                    ],
                    isCurved: true,
                    color: const Color(0xFF7086FD), // Line color
                    barWidth: 4.w, // Responsive bar width
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF7086FD).withOpacity(0.3),
                    ),
                    dotData: FlDotData(
                      show: true, // Show dots
                    ),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF7086FD).withOpacity(0.3), // 30% opacity color
                        const Color(0xFF7086FD).withOpacity(0.05), // 5% opacity color
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
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

  // Widget to display number at each point
  Widget _buildPointNumber(int x, double y) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w), // Responsive horizontal padding
      child: Column(
        children: [
          Text(
            y.toStringAsFixed(0), // Display the value with no decimal
            style: TextStyle(
              fontSize: 14.sp, // Responsive font size
              fontWeight: FontWeight.w600,
              color: const Color(0xff3e3e3e),
            ),
          ),
          SizedBox(height: 4.h), // Responsive vertical spacing
          Text(
            _getTimeLabel(x), // Get time label based on X axis value
            style: TextStyle(
              fontSize: 10.sp, // Responsive font size
              color: const Color(0xffaaaaaa),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get time label
  String _getTimeLabel(int index) {
    switch (index) {
      case 0:
        return '10:00';
      case 1:
        return '11:00';
      case 2:
        return '12:00';
      case 3:
        return '1:00';
      case 4:
        return '3:00';
      case 5:
        return '5:00';
      default:
        return '';
    }
  }
}
