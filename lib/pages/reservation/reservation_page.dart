import 'package:RMS/pages/reservation/reservation_details.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:iconsax/iconsax.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _selectedIndex = 0;
  Map<String, dynamic>? selectedOrder;
  String? selectedStatus = 'All';
  String? selectedOperations = 'Running Order';

  final List<String> tabLabels = ['Dine In', 'Take Away', 'Delivery'];
  final List<String> status = ['All', 'Pending', 'In Progress', 'Ready'];
  final List<String> operations = ['Running Order', 'Completed Order'];


  final List<List<Map<String, dynamic>>> tabContent = [
    // Tab 1: Running Orders
    [
      {
        'id': '123',
        'time': '12:00 PM',
        'seated_time': '12:00 PM',
        'payment_time': '1:45:23',
        'operation': 'Running Order',
        'type': 'Dine-in',
        'table_number': '5',
        'floor_number': '1',
        'table_capacity': '6',
        'total_customer': '2',
        'waiter_name': 'John Doe',
        'price': '1000',
        'payment_conformation': 'Paid',
        'progress': '1/3',
        'items': [
          {'name': 'Burger', 'quantity': 2, 'status': 'ready'},
          {'name': 'Fries', 'quantity': 1, 'status': 'pending'},
        ],
      },
      {
        'id': '124',
        'time': '1:00 PM',
        'seated_time': '12:00 PM',
        'payment_time': '9:45:23',
        'operation': 'Running Order',
        'type': 'Dine-in',
        'table_number': '10',
        'floor_number': '2',
        'table_capacity': '6',
        'total_customer': '2',
        'waiter_name': 'Jane Smith',
        'price': '1500',
        'payment_conformation': 'Unpaid',

        'progress': '1/2',
        'items': [
          {'name': 'Pizza', 'quantity': 1, 'status': 'pending'},
          {'name': 'Soda', 'quantity': 1, 'status': 'ready'},
        ],
      },
    ],
    // Tab 2: Completed Orders
    [
      {
        'id': '125',
        'time': '2:00 PM',
        'operation': 'Completed Order',
        'type': 'Take Away',
        'customer_name': 'Alice Brown',
        'phone': '123-456-7890',
        'price': '2000',
        'payment_status': 'Paid',
        'cook_status': 'Ready',
        'payment_conformation': 'Unpaid',
        'progress': '2/2',
        'items': [
          {'name': 'Pasta', 'quantity': 1, 'status': 'ready'},
          {'name': 'Garlic Bread', 'quantity': 2, 'status': 'ready'},
        ],
      },
    ],
    // Tab 3: Delivery Orders
    [
      {
        'id': '126',
        'time': '3:00 PM',
        'operation': 'Running Order',
        'type': 'Delivery',
        'customer_name': 'Bob White',
        'phone': '098-765-4321',
        'address': '123 Main St',
        'price': '1800',
        'payment_status': 'Pending',
        'payment_conformation': 'Paid',
        'cook_status': 'In Progress',
        'progress': '1/3',
        'items': [
          {'name': 'Salad', 'quantity': 1, 'status': 'pending'},
          {'name': 'Smoothie', 'quantity': 2, 'status': 'ready'},
        ],
      },
    ],
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
      selectedOrder = null;
    });
  }

  List<Map<String, dynamic>> getFilteredContent() {
    return tabContent[_selectedIndex].where((order) {
      bool matchesStatus = selectedStatus == 'All' || order['payment_status'] == selectedStatus;
      bool matchesOperation = order['operation'] == selectedOperations;
      return matchesStatus && matchesOperation;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 20,),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  TabContent(
                    tabLabels: tabLabels,
                    selectedIndex: _selectedIndex,
                    onTabSelected: _onTabSelected,
                  ),
                  const SizedBox(height: 20),
                  SearchAndFilter(
                    selectedStatus: selectedStatus,
                    selectedOperations: selectedOperations,
                    status: status,
                    operations: operations,
                    onStatusChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                    onOperationChanged: (value) {
                      setState(() {
                        selectedOperations = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: List.generate(getFilteredContent().length, (index) {
                        final order = getFilteredContent()[index];
                        return SizedBox(
                            width: 250,
                            height: 150,
                            child: OrderCard(
                              order: order,
                              onTap: () {
                                setState(() {
                                  selectedOrder = order; // Set the selected order
                                });
                              },
                              isSelected: selectedOrder == order, // Check if this card is selected
                            )

                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 326,
              height: 832,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xffc2c2c2), width: 2),
                ),
              ),
              child: selectedOrder == null
                  ? const Center(child: Text('Select an order to view details'))
                  : ReservationDetails(order: selectedOrder!),
            ),
          ],
        ),
      ),
    );
  }
}

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

class SearchAndFilter extends StatelessWidget {
  final String? selectedStatus;
  final String? selectedOperations;
  final List<String> status;
  final List<String> operations;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<String?> onOperationChanged;

  const SearchAndFilter({
    required this.selectedStatus,
    required this.selectedOperations,
    required this.status,
    required this.operations,
    required this.onStatusChanged,
    required this.onOperationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 0.6, color: const Color(0xffadadad)),
            ),
            child: const Row(
              children: [
                Icon(Iconsax.search_favorite, color: Color(0xff3e3e3e), size: 18),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 12.0, color: Color(0xffadadad)),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
        Container(
          width: 157,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xffd1d1d1), width: 1),
          ),
          child: DropdownButton2<String>(
            value: selectedStatus,
            onChanged: onStatusChanged,
            isExpanded: true,
            underline: const SizedBox(),
            hint: const Center(child: Text("Status")),
            items: status.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 18),
        Container(
          width: 157,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xffd1d1d1), width: 1),
          ),
          child: DropdownButton2<String>(
            value: selectedOperations,
            onChanged: onOperationChanged,
            isExpanded: true,
            underline: const SizedBox(),
            hint: const Center(child: Text("Operation")),
            items: operations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onTap;
  final bool isSelected;

  const OrderCard({
    Key? key,
    required this.order,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  Icon getStatusIcon(String status) {
    switch (status) {
      case 'Ready':
        return const Icon(
          Icons.check_circle,
          color: Color(0xff00D03E),
          size: 18,
        );
      case 'Pending':
        return const Icon(
          Icons.circle_outlined,
          color: Color(0xffAAAAAA),
          size: 18,
        );
      case 'In Progress':
        return const Icon(
          Icons.timer_outlined,
          color: Color(0xffF8B200),
          size: 18,
        );
      default:
        return const Icon(
          Icons.cancel,
          color: Colors.red,
          size: 18,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Header with Time
            if (order['type'] == 'Dine-in') ...[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ?  const Color(0xff787676) : const Color(0xFFc0c0c0), // Change color on select
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    order['time'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xff787676) : const Color(0xFFc0c0c0),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getStatusIcon(order['cook_status']),
                    const SizedBox(width: 8),
                    Text(
                      order['cook_status'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#${order['id']}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (order['type'] == 'Dine-in') ...[
                            Row(
                              children: [
                                Text(
                                  'T-${order['table_number']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                Text(
                                  ' F-${order['floor_number']}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            Text(
                              '${order['customer_name']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ]
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          order['type'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xfff0f0f0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${order['price']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: order['payment_conformation'] == 'Paid' ? Colors.green : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          order['payment_conformation'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                      Text(
                        '${order['progress']}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
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
  }
}
