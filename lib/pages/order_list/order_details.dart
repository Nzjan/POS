import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../menu/menu_page.dart';
class OrderDetails extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetails({
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 12),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 72,
              width: 331,
              padding: const EdgeInsets.only( bottom: 2),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                        color: const Color(0xFF272727),
                        child: Text(
                          order['type'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${order['id']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _formatDate(DateTime.now()),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        _formatTime(DateTime.now()),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
            const SizedBox(height:15,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (order['type'] == 'Dine-in') ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'T-${order['table_number']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                    const SizedBox(width: 2,),
                                    Text(
                                      'F-${order['floor_number']}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.chair,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 2,),
                                    Text(
                                      '${order['table_capacity']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${order['waiter_name']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.people,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 2,),
                                    Text(
                                      '${order['total_customer']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order['seated_time'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                Text(
                                  order['payment_time'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ] else
                        ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${order['customer_name']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                    ),
                                  ),

                                  Text(
                                    '${order['phone']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Text(
                                order['time'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Lato',
                                ),
                              ),

                              // if (order['type'] == 'Delivery') ...[
                              //   const SizedBox(height: 4),
                              //   Text(
                              //     'Address: ${order['address']}',
                              //     style: const TextStyle(
                              //       fontSize: 14,
                              //       fontFamily: 'Lato',
                              //     ),
                              //   ),
                              // ],
                            ],
                          ),
                        ],
                    ])),
            const SizedBox(height: 16),
            Container(
                height: 67,
                width: 294,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          order['payment_conformation'],
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
                          '\$${order['price']}',
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(6),
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
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Order ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffABABAB),
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            '#${order['id']}',
                            style:  const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ],
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

                  const Divider(),
                  Column(
                    children: List.generate(order['items'].length, (index) {
                      final item = order['items'][index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(width: 2,),
                            Text(
                              '*${item['quantity']}',
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                        trailing: item['status'] == 'ready'
                            ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 18, // Adjust size as needed
                        )
                            : item['status'] == 'pending'
                            ? const Icon(
                          Icons.circle_outlined,
                          color: Colors.grey,

                          size: 18, // Adjust size as needed
                        )
                            : item['status'] == 'in progress'
                            ? const Icon(
                          Icons.timer_outlined,
                          color: Colors.orange,
                          size: 18, // Adjust size as needed
                        )
                            : const Icon(
                          Icons.cancel, // Default icon if status doesn't match
                          color: Colors.red,
                          size: 18,
                        ),

                      );
                    }),
                  ),
                ],
              ) ,
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 45,
                width: 259,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, // Text color
                    backgroundColor: Colors.white, // Background color
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black, width: 1), // Border color and width
                    ),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    MaterialPageRoute(builder: (context) => const MenuPage());
                  },
                  child: const Text("Add Item"),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 45,
                width: 259,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Text color
                    backgroundColor: const Color(0xffad6fe0), // Background color
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {

                  },
                  child: const Text("Check Out"),
                ),
              ),
            )
          ],
        )
    );
  }
  // Formats date to 'MMM d' format
  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  // Formats time to 'hh:mm a' (12-hour format with AM/PM)
  String _formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm');
    return formatter.format(dateTime);
  }
}
