import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onTap;
  final bool isSelected; // New property to check if the card is selected

  const OrderCard({
    Key? key,
    required this.order,
    required this.onTap,
    this.isSelected = false, // Default is not selected
  }) : super(key: key);

  Icon getStatusIcon(String status) {
    switch (status) {
      case 'Ready':
        return const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 18,
        );
      case 'Pending':
        return const Icon(
          Icons.circle_outlined,
          color: Colors.grey,
          size: 18,
        );
      case 'In Progress':
        return const Icon(
          Icons.timer_outlined,
          color: Colors.orange,
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
                  color: isSelected ? Colors.blue[100] : const Color(0xFFc0c0c0), // Change color on select
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
