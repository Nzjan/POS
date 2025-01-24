import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  final List<Order> dineInOrders = [
    Order(table: "T-1", orderId: "1001", waiterName: "Abhishake Shahi", completedItems: 3, totalItems: 8),
    Order(table: "T-2", orderId: "1002", waiterName: "Nikita Sharma", completedItems: 5, totalItems: 8),
    Order(table: "T-3", orderId: "1003", waiterName: "Ravi Kumar", completedItems: 2, totalItems: 5),
    Order(table: "T-4", orderId: "1004", waiterName: "Priya Yadav", completedItems: 7, totalItems: 7),
    Order(table: "T-5", orderId: "1005", waiterName: "Ankit Singh", completedItems: 4, totalItems: 6),
  ];

  final List<Order> takeAwayOrders = [
    Order(orderId: "2001", customerName: "Rohit Mehta", completedItems: 4, totalItems: 5),
    Order(orderId: "2002", customerName: "Aarav Gupta", completedItems: 0, totalItems: 4),
    Order(orderId: "2003", customerName: "Simran Kaur", completedItems: 4, totalItems: 4),
    Order(orderId: "2004", customerName: "Maya Patel", completedItems: 5, totalItems: 5),
  ];

  final List<Order> deliveryOrders = [
    Order(orderId: "3001", deliveryGuyName: "Aakash Verma", completedItems: 2, totalItems: 3),
    Order(orderId: "3002", deliveryGuyName: "Sanya Rao", completedItems: 3, totalItems: 5),
    Order(orderId: "3003", deliveryGuyName: "Rajesh Yadav", completedItems: 5, totalItems: 6),
    Order(orderId: "3004", deliveryGuyName: "Neha Kumar", completedItems: 0, totalItems: 4),
  ];

  bool isDineInSelected = true;
  bool isTakeAwaySelected = false;
  bool isDeliverySelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 725.h, // Responsive height
      padding: EdgeInsets.all(16.w), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Responsive border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders',
            style: TextStyle(
              fontSize: 21.sp, // Responsive font size
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          _buildOrderTabBar(),
          SizedBox(height: 2.h),
          Expanded(
            child: isDineInSelected
                ? _buildDineInOrderListView()
                : isTakeAwaySelected
                ? _buildTakeAwayOrderListView()
                : isDeliverySelected
                ? _buildDeliveryOrderListView()
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTabBar() {
    return Container(
      width: double.infinity, // Make it responsive to screen width
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xff969696), width: 0.8),
        borderRadius: BorderRadius.circular(8.r), // Responsive border radius
      ),
      child: Row(
        children: [
          _buildOrderTab('Dine-in', isDineInSelected, () {
            setState(() {
              isDineInSelected = true;
              isTakeAwaySelected = false;
              isDeliverySelected = false;
            });
          }),
          _buildOrderTab('Take Away', isTakeAwaySelected, () {
            setState(() {
              isTakeAwaySelected = true;
              isDineInSelected = false;
              isDeliverySelected = false;
            });
          }),
          _buildOrderTab('Delivery', isDeliverySelected, () {
            setState(() {
              isDeliverySelected = true;
              isDineInSelected = false;
              isTakeAwaySelected = false;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildOrderTab(String title, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.w), // Responsive padding
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffEADBF9) : Colors.white,
            borderRadius: title == 'Dine-in'
                ? BorderRadius.only(topLeft: Radius.circular(8.r), bottomLeft: Radius.circular(8.r))
                : title == 'Delivery'
                ? BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r))
                : null,
            border: title == 'Take Away'
                ? const Border(
              left: BorderSide(color: Color(0xff969696), width: 0.8),
              right: BorderSide(color: Color(0xff969696), width: 0.8),
            )
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp, // Responsive font size
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : const Color(0xff6a6a6a),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDineInOrderListView() {
    return ListView.builder(
      itemCount: dineInOrders.length,
      itemBuilder: (context, index) {
        return _DineInOrderContent(order: dineInOrders[index]);
      },
    );
  }

  Widget _buildTakeAwayOrderListView() {
    return ListView.builder(
      itemCount: takeAwayOrders.length,
      itemBuilder: (context, index) {
        return _TakeAwayOrderContent(order: takeAwayOrders[index]);
      },
    );
  }

  Widget _buildDeliveryOrderListView() {
    return ListView.builder(
      itemCount: deliveryOrders.length,
      itemBuilder: (context, index) {
        return _DeliveryOrderContent(order: deliveryOrders[index]);
      },
    );
  }
}

class _DineInOrderContent extends StatelessWidget {
  final Order order;

  const _DineInOrderContent({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w), // Responsive padding
          child: Row(
            children: [
              Container(
                width: 48.w, // Responsive width
                height: 40.h, // Responsive height
                decoration: BoxDecoration(
                  color: const Color(0xffffc7c7),
                  borderRadius: BorderRadius.circular(6.r), // Responsive border radius
                  border: Border.all(color: const Color(0xffED4B46)),
                ),
                child: Center(
                  child: Text(
                    order.table!,
                    style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w), // Responsive spacing
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("#", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                            Text(order.orderId, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(order.waiterName, style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${order.completedItems}/${order.totalItems}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700)),
                            Text(' items', style: TextStyle(color: const Color(0xff969696), fontSize: 12.sp)),
                          ],
                        ),
                        if (order.completedItems == order.totalItems)
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.solidCircleCheck, color: const Color(0xff00d03e), size: 14.sp),
                              Text(' Served', style: TextStyle(color: const Color(0xff6a6a6a), fontSize: 10.sp)),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xffe3e3e3)),
      ],
    );
  }
}

class _TakeAwayOrderContent extends StatelessWidget {
  final Order order;

  const _TakeAwayOrderContent({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String statusText = getStatusText(order.completedItems, order.totalItems);
    IconData statusIcon = getStatusIcon(order.completedItems, order.totalItems);
    Color statusIconColor = getStatusIconColor(order.completedItems, order.totalItems);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w), // Responsive padding
          child: Row(
            children: [
              Container(
                width: 65.w, // Responsive width
                height: 40.h, // Responsive height
                decoration: BoxDecoration(
                  color: const Color(0xffffc7c7),
                  borderRadius: BorderRadius.circular(6.r), // Responsive border radius
                  border: Border.all(color: const Color(0xffED4B46)),
                ),
                child: Center(
                  child: Text(
                    order.orderId,
                    style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w700,fontSize: 14.sp,),
                  ),
                ),
              ),
              SizedBox(width: 12.w), // Responsive spacing
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.customerName, style: TextStyle(fontSize: 12.sp)),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(statusIcon, color: statusIconColor, size: 14.sp),
                            Text(
                              statusText,
                              style: TextStyle(color: const Color(0xff6a6a6a), fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${order.completedItems}/${order.totalItems}',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700)),
                        Text(' items',
                            style: TextStyle(
                                color: const Color(0xff969696),
                                fontSize: 12.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xffe3e3e3)),
      ],
    );
  }
}

class _DeliveryOrderContent extends StatelessWidget {
  final Order order;

  const _DeliveryOrderContent({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String statusText = getStatusText(order.completedItems, order.totalItems);
    IconData statusIcon = getStatusIcon(order.completedItems, order.totalItems);
    Color statusIconColor = getStatusIconColor(order.completedItems, order.totalItems);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w), // Responsive padding
          child: Row(
            children: [
              Container(
                width: 65.w, // Responsive width
                height: 40.h, // Responsive height
                decoration: BoxDecoration(
                  color: const Color(0xffffc7c7),
                  borderRadius: BorderRadius.circular(6.r), // Responsive border radius
                  border: Border.all(color: const Color(0xffED4B46)),
                ),
                child: Center(
                  child: Text(
                    order.orderId,
                    style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w700,fontSize: 14.sp,),
                  ),
                ),
              ),
              SizedBox(width: 12.w), // Responsive spacing
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.deliveryGuyName, style: TextStyle(fontSize: 12.sp)),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(statusIcon, color: statusIconColor, size: 14.sp),
                            Text(
                              statusText,
                              style: TextStyle(color: const Color(0xff6a6a6a), fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${order.completedItems}/${order.totalItems}',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700)),
                        Text(' items',
                            style: TextStyle(
                                color: const Color(0xff969696),
                                fontSize: 12.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xffe3e3e3)),
      ],
    );
  }
}

// Helper functions to get status based on order completion
String getStatusText(int completedItems, int totalItems) {
  if (completedItems == totalItems) {
    return ' Ready for Pickup'; // For Takeaway
  } else if (completedItems > 0) {
    return ' In Progress';
  } else {
    return ' Pending';
  }
}

IconData getStatusIcon(int completedItems, int totalItems) {
  if (completedItems == totalItems) {
    return FontAwesomeIcons.solidCircleCheck; // Served icon
  } else if (completedItems > 0) {
    return Icons.timer_outlined; // In progress icon
  } else {
    return FontAwesomeIcons.circle; // Pending icon
  }
}

// Function to get icon color based on the status
Color getStatusIconColor(int completedItems, int totalItems) {
  if (completedItems == totalItems) {
    return const Color(0xff00D03E); // Green (Ready for Pickup)
  } else if (completedItems > 0) {
    return const Color(0xffF8B200); // Yellow/Amber (In Progress)
  } else {
    return const Color(0xffAAAAAA); // Grey (Pending)
  }
}

class Order {
  final String? table; // Optional for Takeaway and Delivery
  final String orderId;
  final String waiterName; // non-nullable
  final String customerName; // non-nullable
  final String deliveryGuyName; // non-nullable
  final int completedItems;
  final int totalItems;

  Order({
    this.table, // Optional for Takeaway and Delivery
    required this.orderId,
    this.waiterName = '', // Default empty for Takeaway/Delivery
    this.customerName = '', // Default empty for Dine-in/Delivery
    this.deliveryGuyName = '', // Default empty for Dine-in/Takeaway
    required this.completedItems,
    required this.totalItems,
  });
}
