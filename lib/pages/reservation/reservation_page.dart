import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';


class ReservationDetails extends StatefulWidget {
  final Map<String, String>? selectedItem;

  const ReservationDetails({super.key, this.selectedItem});

  @override
  _ReservationDetailsState createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  // Variable to track hover state for buttons (example)
  final bool _isHovered = false;

  // Format Date and Time
  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  // Generate random payment status
  String _getRandomPaymentStatus() {
    final random = Random();
    return random.nextBool() ? "Advance Paid" : "Pending";
  }

  // Generate random advance payment amount between $5 and $50
  String _generateRandomAdvancePayment() {
    final random = Random();
    double amount = (random.nextInt(46) + 5).toDouble(); // Random value between 5 and 50
    return amount.toStringAsFixed(2); // Format to two decimal places
  }

  // Show confirmation dialog
  void _showCancelConformation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // Set the border radius to 24
          ),
          contentPadding: EdgeInsets.zero, // Zero padding inside the dialog box
          content: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18), // Rounded corners for the container
            ),
            width: 479,
            height: 223,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Are you sure you want to cancel this reservation?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 196,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xff292929), // Text color
                            backgroundColor: const Color(0xFFfafafa), // Button background color
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Color(0xFF292929), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 196,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              _isHovered
                                  ? const Color(0xFF9B6BE1) // Lighter version for hover
                                  : const Color(0xFFAD6FE0), // Original color for normal state
                            ),
                            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 14)),
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Border radius: 10px
                            )),
                            foregroundColor: WidgetStateProperty.all(Colors.white),
                            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                          ),
                          child: const Text("Confirm Cancellation"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      height: 832,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color(0xffc2c2c2),
            width: 2,
          ),
        ),
        color: Color(0xfffafafa),
      ),
      child: widget.selectedItem == null
          ? const Center(child: Text(''))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      _formatDate(DateTime.now()),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
            const SizedBox(height: 12),
            Text(
              '${widget.selectedItem!['reserve_no']}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Column(
              children: [
                // Customer info container
                GestureDetector(
                  onTap: () => _showCancelConformation(context), //line 43
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    height: 117,
                    width: 313,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.selectedItem!['customer']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.people,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${widget.selectedItem!['customer_no']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.selectedItem!['phone_no']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.selectedItem!['date']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${widget.selectedItem!['time']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '${widget.selectedItem!['day']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "in 3 days",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Payment status and advance payment container
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 72,
                  width: 313,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Payment Status:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _getRandomPaymentStatus(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Advance Payment:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "\$${_generateRandomAdvancePayment()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Main page with reservation list
class ReservationPage extends StatefulWidget {

  const ReservationPage({super.key,

  });


  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final bool _isHovered = false; // Track hover state
  bool isDrawerExpanded = false; // Tracks the drawer state (collapsed/expanded).
  int selectedPageIndex = 0; // Tracks the selected page index.
  bool isSelectedHeader = false;

  void toggleDrawer() {
    setState(() {
      isDrawerExpanded = !isDrawerExpanded;
    });
  }

  //

  // List of items, each with random data
  List<Map<String, String>> items = List.generate(
    12,
        (index) =>
    {
      'reserve_no': 'R-${(index + 1).toString().padLeft(4, '0')}',
      'customer': _getRandomName(),
      'customer_no': (Random().nextInt(10) + 1).toString(),
      'phone_no': _generatePhoneNumber(),
      'date': _getRandomDate(),
      'time': _getRandomTime(),
      'day': _getRandomDay(),
    },
  );

  // Track the selected index
  int? selectedIndex;

  // Generate random name for customer
  static String _getRandomName() {
    const names = [
      'Mr. Bond',
      'Ms. Watson',
      'Mr. Smith',
      'Mrs. Green',
      'Mr. Stark',
      'Ms. Lee'
    ];
    return names[Random().nextInt(names.length)];
  }

  // Generate random date
  static String _getRandomDate() {
    final random = Random();
    int day = random.nextInt(30) + 1;
    int month = random.nextInt(12) + 1;
    int year = random.nextInt(3) + 2023; // Random year within 2023-2025
    return '$day-${month.toString().padLeft(2, '0')}-$year';
  }

  // Generate random phone number starting with 9
  static String _generatePhoneNumber() {
    final random = Random();
    String phoneNumber = '9'; // Start with 9
    for (int i = 0; i < 9; i++) {
      phoneNumber += random.nextInt(10).toString(); // Add 9 random digits
    }
    return phoneNumber;
  }

  // Generate random time
  static String _getRandomTime() {
    int hour = Random().nextInt(12) + 1;
    int minute = Random().nextInt(60);
    String startTime = '$hour:${minute.toString().padLeft(2, '0')}';
    // Add 1 hour for the end time
    hour = (hour % 12) + 1; // Increase hour by 1, wrap around to 1 if 12
    String endTime = '$hour:${minute.toString().padLeft(2, '0')}';
    return '$startTime - $endTime';
  }

  // Generate random day (AM/PM)
  static String _getRandomDay() {
    return Random().nextBool() ? 'AM' : 'PM';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 96, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 154,
                      child: ElevatedButton(
                        onPressed: () {
                          _showReservationForm(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            _isHovered
                                ? const Color(0xFF9B6BE1) // Lighter version of the primary color for hover state
                                : const Color(0xFFAD6FE0), // Original color (for normal state)
                          ),
                          padding: WidgetStateProperty.all(const EdgeInsets.all(14)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Border radius: 10px
                          )),
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                          textStyle: WidgetStateProperty.all(const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lato',
                          )),
                        ),
                        child: const Text("New Reservation"),
                      ),
                    ),
                    const SizedBox(width: 31,)
                  ],
                ),
                const SizedBox(height: 20,),
                // Wrap your reservation cards in a SingleChildScrollView for vertical scrolling
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,  // This allows vertical scrolling
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: List.generate(
                          items.length,
                              (index) {
                            final item = items[index];
                            bool isSelected = selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex =
                                  isSelected ? null : index; // Toggle selection
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.zero,
                                height: 103,
                                width: 196,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFFb1bac8),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // Top container with conditional color change
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                      height: 31,
                                      width: 196,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        color: isSelected ? const Color(0xFFb1bac8) : const Color(0xFFecf0f3),
                                        border: Border.all(
                                          color: isSelected ? const Color(0xFFb1bac8) : const Color(0xFFecf0f3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item['reserve_no']!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: isSelected ? Colors.white : const Color(0xFF333333),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10, top: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item['customer']!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Color(0xFF333333),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.people,
                                                    size: 15,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    item['customer_no']!,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 14,
                                                      color: Color(0xFF333333),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item['date']!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    item['time']!,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    item['day']!,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 9,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                "in 3 days",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 8,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ReservationDetails widget for the right side
          ReservationDetails(selectedItem: selectedIndex == null ? null : items[selectedIndex!]),
        ],
      ),
    );
  }



  void _showReservationForm(BuildContext context) { //line 558
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                24), // Set the border radius to 24
          ),
          contentPadding: EdgeInsets.zero, // Zero padding inside the dialog box
          content: SingleChildScrollView(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 26),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  24), // Rounded corners for the container
            ),
            width: 504,
            height: 736,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "T-23",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff292929),
                            ),
                          ),
                          Text(
                            "Floor: 1",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff999898),
                            ),
                          ),

                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.chair,
                            color: Color(0xff292929),
                            size: 24,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff292929),
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 29,),
                  Container(
                    height: 42,
                    width: 432,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF969696),
                          width: 0.6),
                    ),
                    child: const TextField(
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 14.0, // Input text size
                        color: Colors.black, // Input text color
                      ),
                      decoration: InputDecoration(
                        hintText: 'Notes', // This is the placeholder text
                        hintStyle: TextStyle(
                          color: Color(0xFF969696), // Placeholder text color
                          fontSize: 14.0, // Placeholder text size
                        ),
                        border: InputBorder.none, // Removes the default border
                        contentPadding: EdgeInsets
                            .zero, // Removes extra padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 26,),
                  Container(
                    height: 42,
                    width: 432,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF969696),
                          width: 0.6),
                    ),
                    child: const TextField(
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 14.0, // Input text size
                        color: Colors.black, // Input text color
                      ),
                      decoration: InputDecoration(
                        hintText: 'Notes', // This is the placeholder text
                        hintStyle: TextStyle(
                          color: Color(0xFF969696), // Placeholder text color
                          fontSize: 14.0, // Placeholder text size
                        ),
                        border: InputBorder.none, // Removes the default border
                        contentPadding: EdgeInsets
                            .zero, // Removes extra padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 26,),
                  Container(
                    height: 42,
                    width: 432,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF969696),
                          width: 0.6),
                    ),
                    child: const TextField(
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 14.0, // Input text size
                        color: Colors.black, // Input text color
                      ),
                      decoration: InputDecoration(
                        hintText: 'Phone no.', // This is the placeholder text
                        hintStyle: TextStyle(
                          color: Color(0xFF969696), // Placeholder text color
                          fontSize: 14.0, // Placeholder text size
                        ),
                        border: InputBorder.none, // Removes the default border
                        contentPadding: EdgeInsets
                            .zero, // Removes extra padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 26,),
                  Container(
                    height: 42,
                    width: 432,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF969696),
                          width: 0.6),
                    ),
                    child: const TextField(
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 14.0, // Input text size
                        color: Colors.black, // Input text color
                      ),
                      decoration: InputDecoration(
                        hintText: 'Advance Amount',
                        // This is the placeholder text
                        hintStyle: TextStyle(
                          color: Color(0xFF969696), // Placeholder text color
                          fontSize: 14.0, // Placeholder text size
                        ),
                        border: InputBorder.none,
                        // Removes the default border
                        contentPadding: EdgeInsets
                            .zero, // Removes extra padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 26,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff969696),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 37,
                                width: 97,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xFF969696),
                                      width: 0.6),
                                ),
                                child: const TextField(
                                  maxLines: 5,
                                  style: TextStyle(
                                    fontSize: 14.0, // Input text size
                                    color: Colors.black, // Input text color
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // Removes the default border
                                    contentPadding: EdgeInsets
                                        .zero, // Removes extra padding
                                  ),
                                ),
                              ),


                            ],
                          )

                        ],
                      ),
                      const SizedBox(width: 74,),
                      Column(
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2969696),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 37,
                                width: 97,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xFF969696),
                                      width: 0.6),
                                ),
                                child: const TextField(
                                  maxLines: 5,
                                  style: TextStyle(
                                    fontSize: 14.0, // Input text size
                                    color: Colors.black, // Input text color
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // Removes the default border
                                    contentPadding: EdgeInsets
                                        .zero, // Removes extra padding
                                  ),
                                ),
                              ),
                              const SizedBox(width: 36,),
                              Container(
                                height: 37,
                                width: 93,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xFF969696),
                                      width: 0.6),
                                ),
                                child: const TextField(
                                  maxLines: 5,
                                  style: TextStyle(
                                    fontSize: 14.0, // Input text size
                                    color: Colors.black, // Input text color
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // Removes the default border
                                    contentPadding: EdgeInsets
                                        .zero, // Removes extra padding
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 26,),
                  const Row(
                    children: [
                      Text(
                        "Guests:",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2969696),
                        ),
                      ),
                      SizedBox(width: 21,),
                      SizedBox(
                        width: 139,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.remove_circle_rounded,
                              color: Color(0xff292929),
                              size: 45,
                            ),

                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),

                            Icon(Icons.add_circle,
                              color: Color(0xff292929),
                              size: 45,
                            ),
                          ],
                        )
                        ,)
                    ],
                  ),

                  const SizedBox(height: 26,),
                  Container(
                    height: 100,
                    width: 431,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF969696),
                          width: 0.6),
                    ),
                    child: const TextField(
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 14.0, // Input text size
                        color: Colors.black, // Input text color
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none, // Removes the default border
                        contentPadding: EdgeInsets
                            .zero, // Removes extra padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 48,),
                  SizedBox(
                    height: 45,
                    width: 196,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xff292929),
                        // Text color
                        backgroundColor: const Color(0xFFfafafa),
                        // Button background color
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color(0xFF292929), // Border color
                            width: 1, // Border width
                          ),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      child: const Text("Confirm Reservation"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          ),);
      },
    );
  }
}