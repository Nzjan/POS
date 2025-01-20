import 'package:RMS/pages/menu/right_screens/delivery_page.dart';
import 'package:RMS/pages/menu/right_screens/dine_in_page.dart';
import 'package:RMS/pages/menu/right_screens/take_away_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';

import '../../table/table_page.dart'; // Import the intl package

class OrderSection extends StatefulWidget {
  const OrderSection({super.key});

  @override
  _OrderSectionState createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  String selectedTab = "Dine in"; // Default selected tab
  String hoveredTab = ""; // To track the hovered tab

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 30),
      decoration: const BoxDecoration(
        color: Color(0xfffafafa),
        border: Border(
          left: BorderSide(color: Color(0xFFC2C2C2), width: 1),
        ),
      ),
      child: ScaffoldPage(
        header: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCustomButton(
                    text: _getHeaderButtonText(selectedTab),
                    onPressed: () => _handleHeaderAction(selectedTab),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _formatDate(DateTime.now()),
                        style:
                        const TextStyle(color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,),
                      ),
                      Text(
                        _formatTime(DateTime.now()),
                        style:
                        const TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.black,),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Order",
                      style: TextStyle(
                        color: Color(0xffababab),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: " #1088",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11),
            ],
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dine in Button
                Expanded(
                  child: _buildHoverableTabButton(
                    text: "Dine in",
                    selected: selectedTab == "Dine in",
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      bottomLeft: Radius.circular(28),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedTab = "Dine in";
                      });
                    },
                  ),
                ),

                // TakeAway Button
                Expanded(
                  child: _buildHoverableTabButton(
                    text: "TakeAway",
                    selected: selectedTab == "Take Away",
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedTab = "Take Away";
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildTabContent(selectedTab),
            ),
          ],
        ),
      ),
    );
  }

  // A new function that builds hoverable TabButton
  Widget _buildHoverableTabButton({
    required String text,
    required bool selected,
    required BorderRadius borderRadius,
    required VoidCallback onPressed,
  }) {
    return MouseRegion(
      onEnter: (_) =>
          setState(() {
            hoveredTab = text;
          }),
      onExit: (_) =>
          setState(() {
            hoveredTab = "";
          }),
      child: TabButton(
        text: text,
        selected: selected,
        borderRadius: borderRadius,
        backgroundColor: _getTabBackgroundColor(text, selected),
        textColor: selected ? Colors.white : Colors.black,

        height: 38,
        onPressed: onPressed,
      ),
    );
  }

  Color _getTabBackgroundColor(String tab, bool selected) {
    if (selected) {
      return const Color(0xff333333); // Dark background for selected tab
    }
    if (hoveredTab == tab) {
      return const Color(0xffdcdcdc); // Lighter color on hover
    }
    return const Color(0xfff0f0f0); // Default background for unselected tabs
  }


  Widget _buildCustomButton({
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = const Color(0xff272727),
    Color textColor = Colors.white,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w500,
    EdgeInsets padding =
    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        padding: padding,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }

  void _handleHeaderAction(String tab) {
    switch (tab) {
      case "Dine in":
        _showAssignTableDialog(context);
        break;
      case "Take Away":
        _showCustomerDetailsDialog(context);
        break;
    }
  }

  String _getHeaderButtonText(String tab) {
    switch (tab) {
      case "Dine in":
        return "Assign Table";
      case "Take Away":
        return "Customer Details";
      default:
        return "";
    }
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute
        .toString().padLeft(2, '0')}";
  }

  Widget _buildTabContent(String tab) {
    switch (tab) {
      case "Dine in":
        return const DineInPage();
      case "Take Away":
        return const TakeAwayPage();
      default:
        return const DineInPage();
    }
  }
  void _showAssignTableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          content: SizedBox(
            width: 484, // Set the dialog width to 532
            height: 100, // Set the dialog height to 191
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    "You need to assign a table first.",
                    style: TextStyle(
                      fontSize: 18, // Title text size
                      fontWeight: FontWeight.bold, // Title text weight
                      color: Colors.black, // Title text color
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Add a gap of 32 between the text and the button
                SizedBox(
                  width: 228,
                  child: Button(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color(0xFFAD6FE0)),
                      // Button background color
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      // Text color
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12)),
                      // Button padding
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Border radius
                      )),
                      textStyle: WidgetStateProperty.all(const TextStyle(
                        fontSize: 14, // Button text size
                        fontWeight: FontWeight.w700, // Button text weight
                      )),
                    ),
                    child: const Text("Assign Table"),
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      Navigator.push(
                        context,
                        FluentPageRoute(builder: (context) => TablePage()),
                      ); // Navigate to TablePage
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCustomerDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text("Takeaway Info",
            style: TextStyle(
              fontSize: 18, // Title text size
              fontWeight: FontWeight.bold, // Title text weight
              color: Colors.black, // Title text color
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Name TextBox
              TextBox(
                placeholder: "Name",
                placeholderStyle: const TextStyle(
                  fontSize: 14, // Placeholder text size
                  color: Color(0xff989898), // Placeholder text color
                ),
                style: const TextStyle(
                  fontSize: 14, // Input text size
                  color: Colors.black, // Input text color
                ),
                decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7), // Background color
                  borderRadius: BorderRadius.circular(9), // Rounded corners
                  border: Border.all(
                    color: const Color(0xff999898), // Border color
                    width: 0.7, // Border width
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, // Removes the focus border
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Phone no. TextBox
              TextBox(
                placeholder: "Phone no.",
                placeholderStyle: const TextStyle(
                  fontSize: 14, // Placeholder text size
                  color: Color(0xff989898), // Placeholder text color
                ),
                style: const TextStyle(
                  fontSize: 14, // Input text size
                  color: Colors.black, // Input text color
                ),
                decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7), // Background color
                  borderRadius: BorderRadius.circular(9), // Rounded corners
                  border: Border.all(
                    color: const Color(0xff999898), // Border color
                    width: 0.7, // Border width
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, // Removes the focus border
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Notes TextBox
              Container(
                height: 110,
                padding: const EdgeInsets.all(10),
                // Padding for the entire container
                decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7), // Container background color
                  borderRadius: BorderRadius.circular(9), // Rounded corners
                  border: Border.all(
                    color: const Color(0xff999898), // Border color
                    width: 0.7, // Border width
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Notes:" Label
                    const Text(
                      "Notes:",
                      style: TextStyle(
                        fontSize: 10,
                        // Note text size
                        fontWeight: FontWeight.bold,
                        // Bold style for the note text
                        color: Color(0xffadadad), // Note text color
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextBox(
                      padding: EdgeInsets.zero,
                      placeholder: "Type requirements here...",
                      maxLines: 3,
                      placeholderStyle: const TextStyle(
                          fontSize: 16, // Placeholder text size
                          color: Color(0xff989898), // Placeholder text color
                          fontWeight: FontWeight.w400
                      ),
                      style: const TextStyle(
                        fontSize: 12.0, // Input text size
                        color: Colors.black, // Input text color
                        height: 1.5, // Line spacing
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent, // Transparent background
                        border: Border.all(
                          color: Colors.transparent, // No border
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent, // Removes focus border
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                height: 35,
                width: 250,
                child: Button(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color(0xFFAD6FE0)),
                    // Original background color
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    // Text color
                    padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12)),
                    // Padding
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    )),
                    textStyle: WidgetStateProperty.all(const TextStyle(
                      fontSize: 14, // Font size
                      fontWeight: FontWeight.w700, // Font weight
                    )),
                  ),
                  child: const Text("Confirm"),
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog on confirm
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Border? border;
  final double height;
  final VoidCallback onPressed;

  const TabButton({
    required this.text,
    required this.selected,
    required this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    this.border,
    required this.height,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border,
        ),
        alignment: Alignment.center,
        height: height,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
