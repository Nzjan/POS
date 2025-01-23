import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationDetails extends StatefulWidget {
  final Map<String, dynamic> reserve;

  const ReservationDetails({required this.reserve});

  @override
  _ReservationDetailsState createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  bool _isHovered = false; // Variable to track hover state

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
                            backgroundColor: MaterialStateProperty.all(
                              _isHovered
                                  ? const Color(0xFF9B6BE1) // Lighter version for hover
                                  : const Color(0xFFAD6FE0), // Original color for normal state
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 14)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Border radius: 10px
                            )),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
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
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: Container(
        padding: EdgeInsets.all(16),
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
              '${widget.reserve['reserve_no']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(color: Color(0xffe3e3e3)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showCancelConformation(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                height: 109,
                width: 295,
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
                          '${widget.reserve['customer']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                              '${widget.reserve['total_customer']}',
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
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.reserve['phone_no']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.reserve['date']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.reserve['time']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${widget.reserve['day']}',
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
            const SizedBox(height: 16),
            Container(
                height: 67,
                width: 294,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Payment Status:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff969696),
                            fontFamily: 'Lato',
                          ),
                        ),
                        Text(
                          '${widget.reserve['payment_status']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            color:  Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Amount:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff969696),
                            fontFamily: 'Lato',
                          ),
                        ),
                        Text(
                          '\$${widget.reserve['total_amount']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  // Format Date and Time
  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}