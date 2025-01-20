import 'package:flutter/material.dart';

class TableSelectBar extends StatefulWidget {
  final String selectedTable; // Required parameter
  final String selectedFloor; // Added for floor usage
  final Map<String, int> tableCounts; // Counts for each table status

  const TableSelectBar({
    super.key,
    required this.selectedTable,
    required this.selectedFloor, // Constructor updated
    required this.tableCounts,   // Constructor updated
  });

  @override
  _TableSelectBarState createState() => _TableSelectBarState();
}

class _TableSelectBarState extends State<TableSelectBar> {
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
                // Row with badges and date-time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // "Available" badge section
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(
                            color: _getStatusColor(widget.selectedTable),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4), // Top-left corner radius
                              bottomLeft: Radius.circular(4), // Bottom-left corner radius
                            ),
                          ),
                          child: Text(
                            widget.selectedTable, // Use selectedTable here
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(
                            color: _getStatusColor(widget.selectedTable),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(4),   // Top-right corner radius
                              bottomRight: Radius.circular(4), // Bottom-right corner radius
                            ),
                          ),
                          child: Text(
                            "${widget.tableCounts[widget.selectedTable.toLowerCase()] ?? 0}", // Dynamic count
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Date and Time
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
                // Floor and chair information row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.selectedFloor, // Use selectedFloor
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Show "Floor" only if selectedTable is "All"
                        if (widget.selectedTable == "All")
                          const Text(
                            "Floor",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const SizedBox(height: 12),
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

  // Determines the color for each status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return const Color(0xff3caa6c); // Available color
      case 'seated':
        return const Color(0xffe44f6a); // Seated color
      case 'reserved':
        return const Color(0xffe48736); // Reserved color
      case 'unavailable':
        return const Color(0xff818181); // Unavailable color
      default:
        return Colors.grey; // Default color
    }
  }
}
