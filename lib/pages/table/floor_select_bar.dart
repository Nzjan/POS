import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FloorSelectBar extends StatefulWidget {
  final String selectedFloor;

  const FloorSelectBar({super.key, required this.selectedFloor});

  @override
  _FloorSelectBarState createState() => _FloorSelectBarState();
}

class _FloorSelectBarState extends State<FloorSelectBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xfffafafa),
        border: Border(
          left: BorderSide(color: Color(0xFFC2C2C2), width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffc2c2c2),
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for date and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Formatted Date
                        Text(
                          _formatDate(DateTime.now()),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Formatted Time
                        Text(
                          _formatTime(DateTime.now()),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Floor section
                Text(
                  "${widget.selectedFloor}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),


        ],
      ),
    );
  }

  // Returns formatted date as a string (e.g., "Nov 18")
  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return "${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')}";
  }

  // Returns formatted time as a string (e.g., "1:00 PM")
  String _formatTime(DateTime time) {
    return "${time.hour % 12 == 0 ? 12 : time.hour % 12}:${time.minute.toString().padLeft(2, '0')} ${time.hour >= 12 ? 'PM' : 'AM'}";
  }
}


class TableStatusTablePage extends StatefulWidget {
  @override
  _TableStatusTablePageState createState() => _TableStatusTablePageState();
}

class _TableStatusTablePageState extends State<TableStatusTablePage> {
  // Data variables
  double available = 25;
  double seated = 45;
  double reserved = 28;
  double unavailable = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354,
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
          // Pie Chart and Table
          Expanded(
            child: Column(
              children: [
                // Pie Chart
                SizedBox(
                  height: 118,
                  child: PieChart(
                    PieChartData(
                      sections: _getPieChartData(),
                      sectionsSpace: 4,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 22.5),
                // Table Header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'State',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Table',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 8),
                // Table Status Rows
                Column(
                  children: [
                    _buildStatusRow('Available', available.toString(), '${available}%', const Color(0xff55C184)),
                    _buildStatusRow('Seated', seated.toString(), '${seated}%', const Color(0xffEE5F5B)),
                    _buildStatusRow('Reserved', reserved.toString(), '${reserved}%', const Color(0xffFEAB47)),
                    _buildStatusRow('Unavailable', unavailable.toString(), '${unavailable}%', const Color(0xffCFD8DC)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Pie Chart Data
  List<PieChartSectionData> _getPieChartData() {
    return [
      PieChartSectionData(
        value: available,
        color: const Color(0xff55C184),
        title: '',
        radius: 30,
      ),
      PieChartSectionData(
        value: seated,
        color: const Color(0xffEE5F5B),
        title: '',
        radius: 30,
      ),
      PieChartSectionData(
        value: reserved,
        color: const Color(0xffFEAB47),
        title: '',
        radius: 30,
      ),
      PieChartSectionData(
        value: unavailable,
        color: const Color(0xffCFD8DC),
        title: '',
        radius: 30,
      ),
    ];
  }

  // Build Status Row
  Widget _buildStatusRow(String state, String table, String percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  state,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff3e3e3e),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              table,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff3e3e3e),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              percentage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff3e3e3e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
