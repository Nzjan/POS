import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class RegisterStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204.h, // Make height responsive
      padding: EdgeInsets.all(16.w), // Make padding responsive
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r), // Make border radius responsive
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r, // Make blur radius responsive
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Register Status',
            style: TextStyle(
              fontSize: 16.sp, // Responsive font size
              fontWeight: FontWeight.w700,
              color: const Color(0xff333333),
            ),
          ),
          SizedBox(height: 9.h), // Make spacing responsive
          // Status list
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusRow('Opening float', '\$ 12,000'),
                _buildStatusRow('Cash Sales', '\$ 20,000'),
                _buildStatusRow('Cash Refunds', '-'),
                _buildStatusRow('Cash Out', '-'),
                _buildStatusRow('Cash In', '-'),
                _buildStatusRow('Other Sales', '-'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h), // Make vertical padding responsive
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp, // Responsive font size
              fontWeight: FontWeight.w400,
              color: const Color(0xff585858),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp, // Responsive font size
              fontWeight: FontWeight.w400,
              color: const Color(0xff585858),
            ),
          ),
        ],
      ),
    );
  }
}
