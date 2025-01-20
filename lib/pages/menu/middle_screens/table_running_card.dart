import 'package:fluent_ui/fluent_ui.dart';

class TableRunningCard extends StatelessWidget {
  final bool isSelected; // Whether the card is selected

  const TableRunningCard({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 112, // Fixed width for horizontal scrolling
      height: 42, // Increased height for better visibility
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFE2E0E0) // Highlighted color when selected
            :  Colors.white, // Default color
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffe44f6a),
        ),
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
                  "T-01", // Example table number
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? Colors.black // Text color when selected
                        : const Color(0xff2b2b2b), // Default color
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
                const Text(
                  "8/8", // Static occupancy
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2b2b2b),
                    height: 1.0, // Adjust line height
                  ),
                ),
                const Spacer(), // Fills the space between the two Text widgets
                Text(
                  "#10", // Dynamic table ID
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: isSelected
                        ? Colors.black // Text color when selected
                        : const Color(0xff424242), // Default color
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
