import 'package:RMS/pages/menu/middle_screens/table_running_card.dart';
import 'package:flutter/material.dart';
import 'package:RMS/pages/table/floor_select_bar.dart';
import 'package:RMS/pages/table/table_select_bar.dart';
import 'capacity_widget.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  String selectedFloor = "All"; // Default selected floor filter
  String selectedTable = "All"; // Default selected table status filter
  Set<int> hoveredCards = {}; // Track hovered cards

  final List<Map<String, dynamic>> tableData = [
    {'status': 'Available', 'number': 'T - 1', 'floor': 'Floor 1', 'capacity': 4},
    {'status': 'Reserved', 'number': 'T - 2', 'floor': 'Floor 1', 'capacity': 4, 'time': '13:00 - 14:00'},
    {'status': 'Seated', 'number': 'T - 3', 'floor': 'Floor 1', 'capacity': 6},
    {'status': 'Unavailable', 'number': 'T - 4', 'floor': 'Floor 1', 'capacity': 2},
    {'status': 'Available', 'number': 'T - 5', 'floor': 'Floor 2', 'capacity': 8},
    {'status': 'Seated', 'number': 'T - 6', 'floor': 'Floor 2', 'capacity': 8},
    {'status': 'Reserved', 'number': 'T - 7', 'floor': 'Floor 2', 'capacity': 4, 'time': '15:00 - 16:00'},
  ];

  // Function to filter tables based on selected floor and status
  List<Map<String, dynamic>> get filteredTables {
    return tableData.where((table) {
      final matchesStatus = selectedTable == 'All' || table['status'] == selectedTable;
      final matchesFloor = selectedFloor == 'All' || table['floor'] == selectedFloor;
      return matchesStatus && matchesFloor;
    }).toList();
  }

  // Helper method to format the floor as "F - X"
  String formatFloorForDisplay(String floor) {
    if (floor == 'Floor 1') return 'F - 1';
    if (floor == 'Floor 2') return 'F - 2';
    if (floor == 'Floor 3') return 'F - 3';
    return floor; // If any other floor is passed, return as is.
  }

  // Dynamically calculate table counts based on the filtered tables
  Map<String, int> get tableCounts {
    Map<String, int> counts = {
      "all": 0,
      "available": 0,
      "seated": 0,
      "reserved": 0,
      "unavailable": 0,
    };

    for (var table in filteredTables) {
      switch (table['status']) {
        case 'All':
          counts["all"] = counts["all"]! + 1;
          break;
        case 'Available':
          counts["available"] = counts["available"]! + 1;
          break;
        case 'Seated':
          counts["seated"] = counts["seated"]! + 1;
          break;
        case 'Reserved':
          counts["reserved"] = counts["reserved"]! + 1;
          break;
        case 'Unavailable':
          counts["unavailable"] = counts["unavailable"]! + 1;
          break;
      }
    }

    counts["all"] = filteredTables.length; // Update total count

    return counts;
  }

  // Helper function to get the color for each status
  Color getStatusColor(String status) {
    switch (status) {
      case 'All':
        return const Color(0xff000000);
      case 'Available':
        return const Color(0xff3caa6c);
      case 'Seated':
        return const Color(0xffe44f6a);
      case 'Reserved':
        return const Color(0xffe48736);
      case 'Unavailable':
        return const Color(0xff818181);
      default:
        return Colors.black;
    }
  }

  Widget buildTableStatusLayout(Map<String, dynamic> table, int index) {
    final status = table['status'];
    final isHovered = hoveredCards.contains(index); // Checking hover state

    // Available status layout
    if (status == 'Available') {
      return AnimatedContainer(
        width: 152,
        height: 124,
        decoration: BoxDecoration(
          border: Border.all(
            color: hoveredCards.contains(index)
                ? const Color(0xff3caa6c)
                : const Color(0xff3caa6c),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: hoveredCards.contains(index)
              ? const Color(0xffdaefe5)
              : Colors.white,
        ),
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            // Status tag
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: hoveredCards.contains(index)
                      ? const Color(0xff3caa6c)
                      : const Color(0xffdaefe5),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: const Border(
                    left: BorderSide(color: Color(0xff3caa6c), width: 1.0),
                    bottom: BorderSide(color: Color(0xff3caa6c), width: 1.0),
                  ),
                ),
                child: Text(
                  "Available",
                  style: TextStyle(
                    color: hoveredCards.contains(index)
                        ? Colors.white
                        : const Color(0xff3caa6c),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lato',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            // Seats Info
            Positioned(
              bottom: 12,
              right: 12,
              child: Row(
                children: [
                  const Icon(Icons.chair, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    "${table['capacity']}",  // Dynamic capacity value
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),
            // Centered content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    table['number'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                   Text(
                    formatFloorForDisplay(table['floor']),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Seated status layout
    else if (status == 'Seated') {
      return AnimatedContainer(
        width: 152,
        height: 124,
        decoration: BoxDecoration(
          border: Border.all(
            color: hoveredCards.contains(index)
                ? const Color(0xffe44f6a)
                : const Color(0xffe44f6a),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: hoveredCards.contains(index)
              ? const Color(0xfff8dee4)
              : Colors.white,
        ),
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            // Seated tag
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: hoveredCards.contains(index)
                      ? const Color(0xffe44f6a)
                      : const Color(0xfff8dee4),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: const Border(
                    left: BorderSide(color: Color(0xffe44f6a), width: 1.0),
                    bottom: BorderSide(color: Color(0xffe44f6a), width: 1.0),
                  ),
                ),
                child: Text(
                  "Seated",
                  style: TextStyle(
                    color: hoveredCards.contains(index)
                        ? Colors.white
                        : const Color(0xffe44f6a),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            // Seats Info (Bottom right corner)
            // Seats Info
            Positioned(
              bottom: 12,
              right: 12,
              child: Row(
                children: [
                  const Icon(Icons.chair, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    "${table['capacity']}",  // Dynamic capacity value
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),


            // Table number in bottom left corner
            const Positioned(
              bottom: 12,
              left: 12,
              child: Text(
                "104", // Reserved or Seated Table identifier
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff292929),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    table['number'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                  Text(
                    formatFloorForDisplay(table['floor']),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Reserved status layout
    else if (status == 'Reserved') {
      return AnimatedContainer(
        width: 152,
        height: 124,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffe48736), // Reserved color
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isHovered ? const Color(0xfffaf0e6) : Colors.white,
        ),
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: isHovered ? const Color(0xffe48736) : const Color(0xfffaf0e6),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: const Border(
                    left: BorderSide(color: Color(0xffe48736), width: 1.0),
                    bottom: BorderSide(color: Color(0xffe48736), width: 1.0),
                  ),
                ),
                child: Text(
                  "Reserved",
                  style: TextStyle(
                    color: isHovered ? Colors.white : const Color(0xffe48736),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lato',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 12,
              left: 12,
              child: Row(
                children: [
                  Text(
                    "R-",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                  Text(
                    "8000",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              right: 12,
              child: Row(
                children: [
                  const Icon(Icons.chair, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    "${table['capacity']}",  // Dynamic capacity value
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    table['number'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                  Text(
                    formatFloorForDisplay(table['floor']),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    }

    // Unavailable status layout
    else if (status == 'Unavailable') {
      return AnimatedContainer(
        width: 152,
        height: 124,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff818181), // Unavailable color
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isHovered ? const Color(0xffe8e9ea) : Colors.white,
        ),
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: isHovered ? const Color(0xff818181) : const Color(0xffe8e9ea),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: const Border(
                    left: BorderSide(color: Color(0xff818181), width: 1.0),
                    bottom: BorderSide(color: Color(0xff818181), width: 1.0),
                  ),
                ),
                child: Text(
                  "Unavailable",
                  style: TextStyle(
                    color: isHovered ? Colors.white : const Color(0xff818181),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              right: 12,
              child: Row(
                children: [
                  const Icon(Icons.chair, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    "${table['capacity']}",  // Dynamic capacity value
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    table['number'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                  Text(
                    formatFloorForDisplay(table['floor']),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 97,),
      child: Row(
        children: [
          // Left side - Expanded with flex 4
          Expanded(
            flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 23,),
                child: Column(
                  children: [
                    // Filters and Counters
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF5C5C5C),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Floor selection row
                              Row(
                                children: [
                                  _buildFloorChooseButton(
                                    text: 'All',
                                    selected: selectedFloor == 'All',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "All";
                                      });
                                    },
                                  ),
                                  _buildFloorChooseButton(
                                    text: 'Floor 1',
                                    selected: selectedFloor == 'Floor 1',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "Floor 1";
                                      });
                                    },
                                  ),
                                  _buildFloorChooseButton(
                                    text: 'Floor 2',
                                    selected: selectedFloor == 'Floor 2',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "Floor 2";
                                      });
                                    },
                                  ),
                                  _buildFloorChooseButton(
                                    text: 'Floor 3',
                                    selected: selectedFloor == 'Floor 3',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "Floor 3";
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildTableSearchButton(
                                    text: "All",
                                    selected: selectedTable == "All",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "All";
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  _buildTableSearchButton(
                                    text: "Available",
                                    selected: selectedTable == "Available",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Available";
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  _buildTableSearchButton(
                                    text: "Seated",
                                    selected: selectedTable == "Seated",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Seated";
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  _buildTableSearchButton(
                                    text: "Reserved",
                                    selected: selectedTable == "Reserved",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Reserved";
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  _buildTableSearchButton(
                                    text: "Unavailable",
                                    selected: selectedTable == "Unavailable",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Unavailable";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CapacityWidget(),

                            ],
                          )

                        ],
                      )
                    ),
                    const SizedBox(height: 16),
                    // Display filtered tables based on selected floor and status
                    Expanded(
                      child: SingleChildScrollView(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            children: List.generate(filteredTables.length, (index) {
                              final table = filteredTables[index];

                              return MouseRegion(
                                onEnter: (_) => setState(() => hoveredCards.add(index)),
                                onExit: (_) => setState(() => hoveredCards.remove(index)),
                                child: buildTableStatusLayout(table, index),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ),
          // Right side
          Container(
            padding: EdgeInsets.zero,
            width: 350,
            child: selectedTable == "All"
                ? FloorSelectBar(selectedFloor: selectedFloor)
                : TableSelectBar(
              selectedTable: selectedTable,
              selectedFloor: selectedFloor,
              tableCounts: tableCounts, // Pass tableCounts here
            ),
          ),
        ],
      ),
    );
  }
}


// Table filter button
Widget _buildTableSearchButton({
  required String text,
  required bool selected,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: selected ? const Color(0xffeadbf9) : Colors.white,
      foregroundColor: selected ? Colors.black : const Color(0xff2b2b2b),
      side: BorderSide(
        color: selected ? const Color(0xffeadbf9) : const Color(0xffadadad),
        width: 0.6,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: selected ? Colors.black : const Color(0xff2b2b2b),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

// Floor filter button
Widget _buildFloorChooseButton({
  required String text,
  required VoidCallback onPressed,
  required bool selected,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: selected ? const Color(0xff292929) : Colors.white,
      foregroundColor: selected ? Colors.white : Colors.black,
      side: BorderSide(
        color: selected ? Colors.black : const Color(0xffadadad),
        width: 0.6,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      minimumSize: const Size(70, 38),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
