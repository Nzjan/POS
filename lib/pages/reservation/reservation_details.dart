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

