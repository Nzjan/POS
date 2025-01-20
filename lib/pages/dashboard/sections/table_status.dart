import 'package:fluent_ui/fluent_ui.dart';
import 'package:fl_chart/fl_chart.dart';

class TableStatus extends StatefulWidget {
  @override
  _TableStatusState createState() => _TableStatusState();
}

class _TableStatusState extends State<TableStatus> {
  // Data variables
  double available = 25;
  double seated = 45;
  double cleaning = 0;
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
          // Header Text
          const Text(
            'Table Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff3e3e3e),
            ),
          ),
          const SizedBox(height: 17.5),
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
                    _buildStatusRow('Cleaning', cleaning.toString(), '${cleaning}%', const Color(0xffD0324D)),
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
        value: cleaning,
        color: const Color(0xffD0324D),
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
