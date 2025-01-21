import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        border: Border(
          left: BorderSide(color: const Color(0xFFC2C2C2), width: 1.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xffc2c2c2),
                  width: 1.w,
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
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Formatted Time
                        Text(
                          _formatTime(DateTime.now()),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Floor section
                Text(
                  "${widget.selectedFloor}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          SizedBox(height: 16.h),
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

