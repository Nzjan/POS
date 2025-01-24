import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRunningCard extends StatelessWidget {
  final int index; // Index of the card
  final bool isSelected; // Whether the card is selected

  const TableRunningCard({
    super.key,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h), // Using responsive padding
      width: 112.w, // Responsive width
      height: 46.h, // Responsive height
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffe44f6a)),
        borderRadius: BorderRadius.circular(8.r), // Responsive border radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures leftmost and rightmost alignment
        children: [
          // Left Column
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "T-0${index + 1}", // Dynamic table number
                  style: TextStyle(
                    fontSize: 16.sp, // Responsive font size
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff2b2b2b),
                  ),
                ),
              ],
            ),
          ),

          // Right Column
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max, // Ensures the column takes the full height
              children: [
                 Text(
                  "8/8", // Static occupancy
                  style: TextStyle(
                    fontSize: 12.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2b2b2b),
                    height: 1.0, // Adjust line height
                  ),
                ),
                const Spacer(), // Fills the space between the two Text widgets
                Text(
                  "#10${88 + index}", // Dynamic table ID
                  style: TextStyle(
                    fontSize: 10.sp, // Responsive font size
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff424242),
                    height: 1.0, // Adjust line height
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
