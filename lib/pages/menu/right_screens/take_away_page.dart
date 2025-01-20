
import 'package:RMS/pages/menu/right_screens/bill_summary_confirm_order.dart';
import 'package:RMS/pages/menu/right_screens/bill_summary_takeaway_invoice.dart';
import 'package:RMS/pages/menu/right_screens/dash_board_painter.dart';
import 'package:RMS/pages/menu/right_screens/payment_method.dart';
import 'package:flutter/material.dart';

class TakeAwayPage extends StatefulWidget {
  const TakeAwayPage({super.key});

  @override
  _TakeAwayPageState createState() => _TakeAwayPageState();
}

class _TakeAwayPageState extends State<TakeAwayPage> {
  bool _isHovered = false; // Track hover state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Content goes here'), // Replace with your actual content
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // Padding for the bottom bar
            color: Colors.white,
            // Background color for the bottom navigation bar
            child: Center(
              child: SizedBox(
                height: 45,
                width: 314,
                child: ElevatedButton(
                  onPressed: () {
                    _showConfirmOrder(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      _isHovered
                          ? const Color(
                          0xFF9B6BE1) // Lighter version of the primary color for hover state
                          : const Color(
                          0xFFAD6FE0), // Original color (for normal state)
                    ),
                    padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 14)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Border radius: 10px
                    )),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    // Set text color to white
                    textStyle: WidgetStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  child: const Text("Confirm Order"),
                ),
              ),
            ),
          ),

        ],
      )
    );
  }
  void _showConfirmOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // Set the border radius to 24
          ),
          contentPadding: EdgeInsets.zero, // Zero padding inside the dialog box
          content: SingleChildScrollView(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24), // Rounded corners for the container

            ),
            width: 548,
            height: 754,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 42), // Adjust outer padding
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Type:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff292929),
                                ),
                              ),
                              Text(
                                "Order No.:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff292929),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Take Away",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5a5a5a),
                                ),
                              ),
                              Text(
                                "#1123",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5a5a5a),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff292929),
                                ),
                              ),
                              Text(
                                "Table No.:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff292929),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aakash",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5a5a5a),
                                ),
                              ),

                              Text(
                                "9865134444",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5a5a5a),
                                ),
                              ),
                            ],
                          ),

                        ],
                      )
                    ],
                  ),


                  const SizedBox(height: 32),
                  // Notes section
                  Container(
                    width: 483,
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: const Color(0xff999898),
                        width: 0.7,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#Notes",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff959595),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "CUSTOMER IS ALLERGIC TO ANY KINDS OF NUTS SO.....",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffAD6FE0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // DataTable for order details
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6), // Rounded corners for the container
                      border: Border.all(color: const Color(0xFFF0F0F0), width: 1), // Border color and width
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          // Item Column with black background
                          DataColumn(
                            label: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.black, // Black background for the header
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6), // Rounded top-left corner
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Item',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // White text color for the header
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Quantity Column with black background
                          DataColumn(
                            label: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.black, // Black background for the header
                              ),
                              child: const Center(
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // White text color for the header
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Unit Price Column with black background
                          DataColumn(
                            label: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.black, // Black background for the header
                              ),
                              child: const Center(
                                child: Text(
                                  'Unit Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // White text color for the header
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Total Column with black background
                          DataColumn(
                            label: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.black, // Black background for the header
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6), // Rounded top-right corner
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // White text color for the header
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Burger', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                  Text('Extra Cheese', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              )),
                              DataCell(Center(child: Text('2', style: TextStyle(fontSize: 14)))),
                              DataCell(Center(child: Text('\$5.00', style: TextStyle(fontSize: 14)))),
                              DataCell(Center(child: Text('\$10.00', style: TextStyle(fontSize: 14)))),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pizza', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                  Text('......', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              )),
                              DataCell(Center(child: Text('1', style: TextStyle(fontSize: 14)))),
                              DataCell(Center(child: Text('\$8.00', style: TextStyle(fontSize: 14)))),
                              DataCell(Center(child: Text('\$8.00', style: TextStyle(fontSize: 14)))),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pasta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                  Text('deep fried', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              )),
                              DataCell(Center(child: Text('3', style: TextStyle(fontSize: 14)))),
                              DataCell(Center(child: Text('\$7.50', style: TextStyle(fontSize: 14)))),
                              DataCell(Center(child: Text('\$22.50', style: TextStyle(fontSize: 14)))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Divider(
                    color: Color(0xffb1bacb),
                  ),
                  const BillSummaryDinein(subTotal: 500),

                  const SizedBox(height: 16,),
                  PaymentMethod(),
                  const Spacer(), // This pushes the button to the bottom
                  // Action button inside the container
                  Center(
                    child: SizedBox(
                      height: 35,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFAD6FE0),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        child: const Text("Confirm Payment"),
                        onPressed: () {
                          Navigator.pop(context);
                          _showConfirmPayment(context);

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),)
        );
      },
    );
  }
}
void _showConfirmPayment(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // Set the border radius to 24
        ),
        contentPadding: EdgeInsets.zero, // Zero padding inside the dialog box
        content: Container(
          padding: const EdgeInsets.only(top: 59,left: 42,bottom: 44,right: 42),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24), // Rounded corners for the container
          ),
          width: 395,
          height: 600,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle,
                  color: Color(0xffAD6FE0),
                  size: 109,
                ),
                const SizedBox(height: 30,),
                const Text("Payment Successful",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("\$ 123.98",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 33,),
                const SizedBox(
                  width: 395,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order No.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929),
                          ),
                        ),
                        Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929),
                          ),
                        ),
                        Text(
                          "Payment Time",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929),
                          ),
                        ),


                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "#1123",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5a5a5a),
                          ),
                        ),
                        Text(
                          "Cash",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5a5a5a),
                          ),
                        ),
                        Text(
                          "Cash",

                        ),
                      ],
                    ),
                  ],
                ),
                ),
                const SizedBox(height: 60,),

                Center(
                  child: SizedBox(
                    height: 41,
                    width: 314,
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
                      child: const Text("Go to Menu"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: 125,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xffbdacac), // Text color (dark gray)
                      backgroundColor: Colors.transparent, // Transparent background color
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.print,
                          size: 14,
                          color: Colors.black, // Icon color (black)
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Print Invoice",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // Text color (black)
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _showPrintInvoice(context); // Handle button press
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _showPrintInvoice(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // Set the border radius to 24
        ),
        contentPadding: EdgeInsets.zero, // Zero padding inside the dialog box
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24), // Rounded corners for the container
          ),
          width: 476,
          height: 631,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("LOGO",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Courier Prime',
                  ),
                ),
                const Text("Restaurant Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Courier Prime',
                  ),
                ),
                const Text("Address",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Courier Prime',
                  ),
                ),
                const Text("Phone no.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Courier Prime',
                  ),
                ),
                const SizedBox(height: 48,),
                Container(
                  width: 424,
                  padding:  EdgeInsets.zero,
                  // decoration: const BoxDecoration(
                  //   border: Border(
                  //     top: BorderSide(color: Colors.black, width: 1), // Top border
                  //     //bottom: BorderSide(color: Colors.black, width: 1), // Bottom border
                  //   ),
                  // ),
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 14,),
                          Row(
                            children: [
                              Text("Date:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("2024-02-13",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Text("Order no.:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("1123",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Text("Payment Method:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("Cash",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Time:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("4:00pm",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Text("Server:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("Alok",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Text("Table:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("8",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14,),

                CustomPaint(
                  painter: DashedBorderPainter(), // Custom dashed border painter
                  child: Container(
                    width: 424,
                    padding: const EdgeInsets.only(left: 69, right: 20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Courier Prime',
                          ),
                        ),
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Courier Prime',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 6,),

                Container(
                  width: 424,
                  padding: const EdgeInsets.only(left: 20, right: 57),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cheese Pizza (M)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'Courier Prime',
                              ),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'Courier Prime',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cheese Pizza (M)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'Courier Prime',
                              ),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'Courier Prime',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                const SizedBox(width: 6,),

                const BillSummaryTakeawayInvoice(subTotal: 1000),
                const SizedBox(height: 76,),
                const Center(
                  child: Text(
                    "Thank You for dining with us!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff292929),
                      fontFamily: 'Courier Prime',
                    ),
                  ),
                )
                

              ],
            ),
          ),
        ),
      );
    },
  );
}
