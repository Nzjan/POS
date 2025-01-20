import 'package:fluent_ui/fluent_ui.dart';
import 'package:fl_chart/fl_chart.dart';

class GuestFlowAnalysis extends StatefulWidget {
  @override
  _GuestFlowAnalysisState createState() => _GuestFlowAnalysisState();
}

class _GuestFlowAnalysisState extends State<GuestFlowAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 393,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
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
              const Text(
                'Guest Flow Analysis',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3e3e3e),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle View All action
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Color(0xffaaaaaa), width: 1)),
                  ),
                  child: const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffaaaaaa),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xffaaaaaa), width: 1),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: Color(0xffaaaaaa),
                            fontSize: 10,
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
                            return const Text('10:00',
                                style: TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 10));
                          case 1:
                            return const Text('11:00',
                                style: TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 10));
                          case 2:
                            return const Text('12:00',
                                style: TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 10));
                          case 3:
                            return const Text('1:00',
                                style: TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 10));
                          case 4:
                            return const Text('3:00',
                                style: TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 10));
                          case 5:
                            return const Text('5:00',
                                style: TextStyle(
                                    color: Color(0xffaaaaaa), fontSize: 10));
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
                    barWidth: 4,
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
          // Numbers on Points
          // Padding(
          //   padding: const EdgeInsets.only(top: 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       _buildPointNumber(0, 36),
          //       _buildPointNumber(1, 55),
          //       _buildPointNumber(2, 70),
          //       _buildPointNumber(3, 45),
          //       _buildPointNumber(4, 82),
          //       _buildPointNumber(5, 60),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  // Widget to display number at each point
  Widget _buildPointNumber(int x, double y) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Text(
            y.toStringAsFixed(0), // Display the value with no decimal
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff3e3e3e),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _getTimeLabel(x), // Get time label based on X axis value
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xffaaaaaa),
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
