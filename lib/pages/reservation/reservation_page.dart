import 'package:RMS/pages/reservation/reservation_details.dart';
import 'package:RMS/pages/reservation/reservation_form.dart';
import 'package:flutter/material.dart';


class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

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

  // Hardcoded list of reservation data (JSON format-like)
  List<Map<String, String>> items = [
    {
      'reserve_no': 'R-0001',
      'customer': 'Mr. Bond',
      'customer_no': '3',
      'phone_no': '9123456789',
      'date': '12-01-2023',
      'time': '10:00 - 11:00',
      'day': 'AM',
    },
    {
      'reserve_no': 'R-0002',
      'customer': 'Ms. Watson',
      'customer_no': '2',
      'phone_no': '9234567890',
      'date': '15-02-2023',
      'time': '12:30 - 13:30',
      'day': 'PM',
    },
    {
      'reserve_no': 'R-0003',
      'customer': 'Mr. Smith',
      'customer_no': '1',
      'phone_no': '9345678901',
      'date': '20-03-2024',
      'time': '14:00 - 15:00',
      'day': 'AM',
    },
    {
      'reserve_no': 'R-0004',
      'customer': 'Mrs. Green',
      'customer_no': '5',
      'phone_no': '9456789012',
      'date': '10-05-2023',
      'time': '16:00 - 17:00',
      'day': 'PM',
    },
    {
      'reserve_no': 'R-0005',
      'customer': 'Mr. Stark',
      'customer_no': '4',
      'phone_no': '9567890123',
      'date': '25-06-2024',
      'time': '18:00 - 19:00',
      'day': 'AM',
    },
    {
      'reserve_no': 'R-0006',
      'customer': 'Ms. Lee',
      'customer_no': '2',
      'phone_no': '9678901234',
      'date': '02-08-2025',
      'time': '20:00 - 21:00',
      'day': 'PM',
    },
  ];

  // Track the selected index
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 20, bottom: 20),
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ReservationForm(); // Call the widget class here
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            _isHovered
                                ? const Color(
                                0xFF9B6BE1) // Lighter version of the primary color for hover state
                                : const Color(
                                0xFFAD6FE0), // Original color (for normal state)
                          ),
                          padding: WidgetStateProperty.all(const EdgeInsets.all(
                              14)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Border radius: 10px
                          )),
                          foregroundColor: WidgetStateProperty.all(
                              Colors.white),
                          textStyle: WidgetStateProperty.all(const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lato',
                          )),
                        ),
                        child: const Text("New Reservation"),
                      ),
                    ),
                    const SizedBox(width: 31),
                  ],
                ),
                const SizedBox(height: 20),
                // Wrap your reservation cards in a SingleChildScrollView for vertical scrolling
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    // This allows vertical scrolling
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 10),
                                      height: 31,
                                      width: 196,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        color: isSelected ? const Color(
                                            0xFFb1bac8) : const Color(
                                            0xFFecf0f3),
                                        border: Border.all(
                                          color: isSelected ? const Color(
                                              0xFFb1bac8) : const Color(
                                              0xFFecf0f3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item['reserve_no']!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: isSelected
                                                ? Colors.white
                                                : const Color(0xFF333333),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12,
                                          right: 12,
                                          bottom: 10,
                                          top: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
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
                                                      fontWeight: FontWeight
                                                          .w700,
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
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
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .end,
                                                children: [
                                                  Text(
                                                    item['time']!,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    item['day']!,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight
                                                          .w500,
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
          ReservationDetails(selectedItem: selectedIndex == null
              ? null
              : items[selectedIndex!]),
        ],
      ),
    );
  }
}