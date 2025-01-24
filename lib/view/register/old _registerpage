import 'package:RMS/pages/reservation/reservation_details.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int selectedIndex = 0;  // Defaulting to 0 instead of nullable int
  Map<String, dynamic>? selectedReserve;

  final List<String> tabLabels = ['Upcoming Reservation', 'Reservation History'];

  List<List<Map<String, dynamic>>> tabContent = [
    [
      {
        'reserve_no': 'R-0001',
        'customer': 'Mr. Bond',
        'total_customer': '3',
        'payment_status': 'Paid',
        'date': '12-01-2023',
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day': 'PM',
      },
      {
        'reserve_no': 'R-0002',
        'customer': 'Ms. Watson',
        'total_customer': '2',
        'payment_status': 'Unpaid',
        'date': '15-02-2023',
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day': 'PM',
      },
    ],
    [
      {
        'reserve_no': 'R-0003',
        'customer': 'Mr. Smith',
        'total_customer': '1',
        'payment_status': 'Paid',
        'date': '20-03-2024',
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day': 'PM',
        'total_items': '5',
        'total_amount': '100',
      },
      {
        'reserve_no': 'R-0004',
        'customer': 'Mrs. Green',
        'total_customer': '5',
        'payment_status': 'Paid',
        'date': '10-05-2023',
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day': 'PM',
        'total_items': '6',
        'total_amount': '150',
      },
    ],
  ];

  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
      selectedReserve = null;
    });
  }

  List<Map<String, dynamic>> getFilteredContent() {
    if (selectedIndex < 0 || selectedIndex >= tabContent.length) {
      return [];
    }
    return tabContent[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left Column with Tabs
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tabs
                  TabContent(
                    tabLabels: tabLabels,
                    selectedIndex: selectedIndex,
                    onTabSelected: _onTabSelected,
                  ),
                  const SizedBox(height: 20),
                  // Reservation Cards Scrollable List
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: List.generate(
                            getFilteredContent().length,
                                (index) {
                              final reserve = getFilteredContent()[index];
                              bool isSelected = selectedReserve == reserve;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedReserve = reserve;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: 196,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    color: isSelected
                                        ? (selectedIndex == 1 ? const Color(0xFFecf0f3) : Colors.white)
                                        : Colors.white,  // Body container stays white even when unselected
                                    border: Border.all(
                                      color: const Color(0xFFb1bac8),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      // Reservation number container
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                        height: 29,
                                        width: 196,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          color: isSelected
                                              ? (selectedIndex == 1
                                              ? const Color(0xFFecf0f3)  // White color for Reservation History when selected
                                              : const Color(0xFFc8d0d9))  // Different color for Upcoming Reservation
                                              : (selectedIndex == 1
                                              ? Colors.white  // White color for Reservation History when unselected
                                              : const Color(0xFFecf0f3)),  // Default color for Upcoming Reservation
                                        ),
                                        child: Center(
                                          child: Text(
                                            reserve['reserve_no']!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xFF333333),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 7, top: 4),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  reserve['customer']!,
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
                                                      reserve['total_customer']!,
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
                                            const SizedBox(height: 4),
                                            Text(
                                              reserve['date']!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            if (selectedIndex == 0)
                                              const Text(
                                                "(in 3 days)",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                ),
                                              )
                                            else
                                              Column(
                                                children: [
                                                  const Divider(
                                                    color: Color(0xfff0f0f0),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Items: ${reserve['total_items']}',
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        '\$${reserve['total_amount']}',
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                ,
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
            // Right Panel for Reservation Details
            Container(
              width: 350,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xffc2c2c2), width: 2),
                ),
              ),
              child: selectedReserve == null
                  ? const Center(child: Text(''))
                  : ReservationDetails(reserve: selectedReserve!),
            ),
          ],
        ),
      ),
    );
  }
}

// TabContent Widget
class TabContent extends StatelessWidget {
  final List<String> tabLabels;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TabContent({
    required this.tabLabels,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabLabels.length, (index) {
        bool isSelected = selectedIndex == index;
        return Row(
          children: [
            GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? const Color(0xffad6fe0) : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  tabLabels[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? const Color(0xffad6fe0) : const Color(0xff6a6a6a),
                  ),
                ),
              ),
            ),
            if (index != tabLabels.length - 1) const SizedBox(width: 14),
          ],
        );
      }),
    );
  }
}

