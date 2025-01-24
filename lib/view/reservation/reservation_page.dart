import 'package:RMS/view/reservation/reservation_details.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int selectedIndex = 0;
  Map<String, dynamic>? selectedReserve;
  String selectedStatus = 'Successful'; // Default filter for status (only for Reservation History)
  String searchQuery = ''; // Default search query
  String selectedDay = 'Today'; // Day filter for upcoming reservations
  DateTime? selectedDate;

  final List<String> tabLabels = ['Upcoming Reservation', 'Reservation History'];
  final List<String> statusFilters = ['Successful', 'Cancel'];
  final List<String> dayFilters = ['Today', 'Yesterday', 'Tomorrow'];

  List<List<Map<String, dynamic>>> tabContent = [
    // Upcoming Reservations
    [
      // Today's Reservations
      {
        'reserve_no': 'R-0001',
        'customer': 'Mr. Bond',
        'total_customer': '3',
        'payment_status': 'Successful',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now()), // Today's Date
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day_time': 'PM',
      },
      {
        'reserve_no': 'R-0002',
        'customer': 'Ms. Watson',
        'total_customer': '2',
        'payment_status': 'Cancel',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now()), // Today's Date
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day_time': 'PM',
      },
      // Tomorrow's Reservations
      {
        'reserve_no': 'R-0003',
        'customer': 'Mr. Doe',
        'total_customer': '4',
        'payment_status': 'Successful',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: 1))), // Tomorrow's Date
        'phone_no': '9456789012',
        'time': '14:00 - 15:00',
        'day_time': 'PM',
      },
      {
        'reserve_no': 'R-0004',
        'customer': 'Ms. Green',
        'total_customer': '1',
        'payment_status': 'Cancel',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: 1))), // Tomorrow's Date
        'phone_no': '9456789012',
        'time': '18:00 - 19:00',
        'day_time': 'PM',
      },
      // Yesterday's Reservations
      {
        'reserve_no': 'R-0005',
        'customer': 'Mr. Black',
        'total_customer': '5',
        'payment_status': 'Successful',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now().subtract(Duration(days: 1))), // Yesterday's Date
        'phone_no': '9456789012',
        'time': '12:00 - 13:00',
        'day_time': 'PM',
      },
      {
        'reserve_no': 'R-0006',
        'customer': 'Mrs. White',
        'total_customer': '2',
        'payment_status': 'Cancel',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now().subtract(Duration(days: 1))), // Yesterday's Date
        'phone_no': '9456789012',
        'time': '10:00 - 11:00',
        'day_time': 'AM',
      },
    ],
    // Reservation History
    [
      {
        'reserve_no': 'R-0007',
        'customer': 'Mr. Smith',
        'total_customer': '1',
        'payment_status': 'Successful',
        'date': '20-03-2024',
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day_time': 'PM',
        'total_items': '5',
        'total_amount': '100',
      },
      {
        'reserve_no': 'R-0008',
        'customer': 'Mrs. Green',
        'total_customer': '5',
        'payment_status': 'Cancel',
        'date': '10-05-2023',
        'phone_no': '9456789012',
        'time': '16:00 - 17:00',
        'day_time': 'PM',
        'total_items': '6',
        'total_amount': '150',
      },
    ],
  ];


  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
      selectedReserve = null;
      searchQuery = '';
      selectedStatus = 'Successful';
      selectedDay = 'Today';
      selectedDate = null;
    });
  }

  // Helper function to parse date string into DateTime
  DateTime? parseDate(String dateStr) {
    try {
      // Assuming the date format is 'dd-MM-yyyy'
      return DateFormat('dd-MM-yyyy').parse(dateStr);
    } catch (e) {
      return null; // Return null if parsing fails
    }
  }

  // Get the current date formatted as string
  String getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  List<Map<String, dynamic>> getFilteredContent() {
    List<Map<String, dynamic>> filteredContent = tabContent[selectedIndex];

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filteredContent = filteredContent.where((reserve) =>
      reserve['reserve_no']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          reserve['customer']!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }

    // Apply date filter for Upcoming Reservations (Today, Yesterday, Tomorrow)
    if (selectedIndex == 0) {
      DateTime currentDate = DateTime.now();
      DateTime? selectedDateTime = selectedDay == 'Today' ? currentDate :
      selectedDay == 'Yesterday' ? currentDate.subtract(Duration(days: 1)) :
      selectedDay == 'Tomorrow' ? currentDate.add(Duration(days: 1)) : null;

      if (selectedDateTime != null) {
        filteredContent = filteredContent.where((reserve) {
          DateTime? reserveDate = parseDate(reserve['date']!); // Convert string date to DateTime
          return reserveDate != null &&
              reserveDate.year == selectedDateTime.year &&
              reserveDate.month == selectedDateTime.month &&
              reserveDate.day == selectedDateTime.day;
        }).toList();
      }
    } else if (selectedIndex == 1) {
      // Apply date filter for Reservation History
      if (selectedDate != null) {
        filteredContent = filteredContent.where((reserve) {
          DateTime? reserveDate = parseDate(reserve['date']!); // Convert string date to DateTime
          return reserveDate != null &&
              reserveDate.year == selectedDate!.year &&
              reserveDate.month == selectedDate!.month &&
              reserveDate.day == selectedDate!.day;
        }).toList();
      }

      // Apply status filter for Reservation History
      filteredContent = filteredContent.where((reserve) =>
      reserve['payment_status'] == selectedStatus).toList();
    }

    return filteredContent;
  }

  @override
  void initState() {
    super.initState();
    // Ensure the default filter is set to "Today" when the page is initialized
    selectedDay = 'Today';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Main Content: Tabs and Reservations
            Expanded(
              child: Row(
                children: [
                  // Left Column with Tabs and Reservations
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
                        // Search and Filters Row (for both Upcoming Reservation and Reservation History)
                        Row(
                          children: [
                            // Search Field
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 46,
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey, // Set the border color
                                    width: 1.0, // Set the border width
                                  ),
                                  borderRadius: BorderRadius.circular(8.0), // Optional: Set border radius for rounded corners
                                ),
                                child: Align(
                                  alignment: Alignment.center, // This ensures vertical (and horizontal) centering
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        searchQuery = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search),
                                      hintText: 'Search',
                                      border: InputBorder.none, // Disable the default border
                                    ),
                                  ),
                                ),
                              ),

                            ),
                            const SizedBox(width: 16),
                            // Day Filter Dropdown for Upcoming Reservation
                            if (selectedIndex == 0)
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 157,
                                  height: 46,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: const Color(0xffd1d1d1), width: 1),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedDay,
                                    items: dayFilters.map((day) {
                                      return DropdownMenuItem(
                                        value: day,
                                        child: Text(day),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDay = value!;
                                      });
                                    },
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    hint: const Center(child: Text("Day")),
                                  ),
                                ),
                              ),


                            if (selectedIndex == 1)
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 157,
                                  height: 46,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: const Color(0xffd1d1d1), width: 1),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: selectedDate ?? DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null && pickedDate != selectedDate) {
                                        setState(() {
                                          selectedDate = pickedDate;
                                        });
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        selectedDate == null
                                            ? 'Select Date'
                                            : '${selectedDate!.toLocal()}'.split(' ')[0],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            if (selectedIndex == 1)
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 157,
                                  height: 46,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: const Color(0xffd1d1d1), width: 1),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      value: selectedStatus,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedStatus = value!;
                                        });
                                      },
                                      isExpanded: true,
                                      hint: const Center(child: Text("Status")),
                                      items: statusFilters.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),

                          ],
                        ),
                        const SizedBox(height: 16),
                        // Reservation Cards Scrollable List
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Align(alignment: Alignment.topLeft,
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
                                          // Reservation Header
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
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                if (selectedIndex == 1)
                                                  Icon(
                                                    reserve['payment_status'] == 'Successful'
                                                        ? Icons.check_circle
                                                        : Icons.cancel,
                                                    color: reserve['payment_status'] == 'Successful'
                                                        ? Color(0xff00d03e)
                                                        : Color(0xffFF3232),
                                                    size: 18,
                                                  ),
                                                SizedBox(width: 6,),
                                                Text(
                                                  reserve['reserve_no']!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xFF333333),
                                                  ),
                                                ),
                                                // Hide status for "Upcoming Reservations"

                                              ],
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
                                    ),
                                  );
                                },
                              ),
                            ),
                            )),
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
                        ? const Center(child: Text('No reservation selected'))
                        : ReservationDetails(reserve: selectedReserve!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TabContent Widget (unchanged)
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
        return GestureDetector(
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
                color: isSelected ? const Color(0xffad6fe0) : const Color(0xFF333333),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }),
    );
  }
}
