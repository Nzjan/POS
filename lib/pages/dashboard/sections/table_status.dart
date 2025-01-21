import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
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
      height: 354.h, // Using ScreenUtil for height
      padding: EdgeInsets.all(16.w), // Using ScreenUtil for padding
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
          // Header Text
          Text(
            'Table Status',
            style: TextStyle(
              fontSize: 16.sp, // Responsive font size
              fontWeight: FontWeight.w600,
              color: const Color(0xff3e3e3e),
            ),
          ),
          SizedBox(height: 17.5.h), // Responsive spacing
          // Pie Chart
          SizedBox(
            height: 118.h, // Responsive height for pie chart
            child: PieChart(
              PieChartData(
                sections: _getPieChartData(),
                sectionsSpace: 4.w, // Responsive space between sections
                centerSpaceRadius: 40.w, // Responsive center space radius
              ),
            ),
          ),
          SizedBox(height: 22.5.h), // Responsive height for spacing
          // Table Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'State',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.sp, // Responsive font size
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffaaaaaa),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Table',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp, // Responsive font size
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffaaaaaa),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp, // Responsive font size
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffaaaaaa),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: 8.h), // Responsive height for spacing
          // Scrollable data section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildStatusRow('Available', available.toString(), '${available}%', const Color(0xff55C184)),
                  _buildStatusRow('Seated', seated.toString(), '${seated}%', const Color(0xffEE5F5B)),
                  _buildStatusRow('Cleaning', cleaning.toString(), '${cleaning}%', const Color(0xffD0324D)),
                  _buildStatusRow('Reserved', reserved.toString(), '${reserved}%', const Color(0xffFEAB47)),
                  _buildStatusRow('Unavailable', unavailable.toString(), '${unavailable}%', const Color(0xffCFD8DC)),
                ],
              ),
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
        radius: 30.r, // Responsive radius
      ),
      PieChartSectionData(
        value: seated,
        color: const Color(0xffEE5F5B),
        title: '',
        radius: 30.r, // Responsive radius
      ),
      PieChartSectionData(
        value: cleaning,
        color: const Color(0xffD0324D),
        title: '',
        radius: 30.r, // Responsive radius
      ),
      PieChartSectionData(
        value: reserved,
        color: const Color(0xffFEAB47),
        title: '',
        radius: 30.r, // Responsive radius
      ),
      PieChartSectionData(
        value: unavailable,
        color: const Color(0xffCFD8DC),
        title: '',
        radius: 30.r, // Responsive radius
      ),
    ];
  }

  // Build Status Row
  Widget _buildStatusRow(String state, String table, String percentage, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h), // Responsive vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 12.w, // Responsive width for the circle
                  height: 12.h, // Responsive height for the circle
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w), // Responsive width for spacing
                Text(
                  state,
                  style: TextStyle(
                    fontSize: 14.sp, // Responsive font size
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff3e3e3e),
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
              style: TextStyle(
                fontSize: 14.sp, // Responsive font size
                fontWeight: FontWeight.w400,
                color: const Color(0xff3e3e3e),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              percentage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp, // Responsive font size
                fontWeight: FontWeight.w400,
                color: const Color(0xff3e3e3e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
