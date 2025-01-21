import 'package:RMS/pages/menu/right_screens/bill_summary_confirm_order.dart';
import 'package:flutter/material.dart';

class DineInPage extends StatefulWidget {
  const DineInPage({super.key});

  @override
  _DineInPageState createState() => _DineInPageState();
}

class _DineInPageState extends State<DineInPage> {
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
          content: SingleChildScrollView(  // Wrapping the entire content in a scrollable view
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24), // Rounded corners for the container
              ),
              width: 553,
              height: 676,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 42), // Adjust outer padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order type row
                    const Row(
                      children: [
                        Text(
                          "Order Type:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff292929),
                          ),
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Dine In",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5a5a5a),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "Order No.:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff292929),
                          ),
                        ),
                        SizedBox(width: 32),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6), // Rounded corners for the container
                          border: Border.all(color: const Color(0xFFF0F0F0), width: 1), // Border color and width
                        ),
                        child: DataTable(
                          columns: [

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
                          child: const Text("Confirm Order"),
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog on confirm
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

        );
      },
    );
  }

}
