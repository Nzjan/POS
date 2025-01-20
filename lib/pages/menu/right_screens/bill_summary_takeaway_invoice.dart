import 'package:fluent_ui/fluent_ui.dart';

import 'dash_board_painter.dart';

class BillSummaryTakeawayInvoice extends StatelessWidget {
  final double subTotal;



  const BillSummaryTakeawayInvoice({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    double tax = subTotal * 0.13; // 13% tax
    double discount = subTotal * 0.15; // 15% discount
    double finalAmount = subTotal + tax - discount;

    return Container(
      width: 424, // Ensures full width
      padding:  EdgeInsets.zero, // Adjust horizontal padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtotal Section
          CustomPaint(
          painter: DashedBorderPainter(), // Custom dashed bottom border painter
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                // No other borders here, just for the bottom border
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sub Total Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sub Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff292929),
                        fontFamily: 'Courier Prime',
                      ),
                    ),
                    Text("\$${subTotal.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff292929),
                        fontFamily: 'Courier Prime',
                      ),),
                  ],
                ),
                // Discount Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Discount",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff292929),
                        fontFamily: 'Courier Prime',
                      ),
                    ),
                    Text("-\$${discount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff292929),
                        fontFamily: 'Courier Prime',
                      ),),
                  ],
                ),
                // Tax Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tax(8%)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff292929),
                        fontFamily: 'Courier Prime',
                      ),
                    ),
                    Text("\$${tax.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff292929),
                        fontFamily: 'Courier Prime',
                      ),),
                  ],
                ),
              ],
            ),
          ),
          ),

          const SizedBox(height: 7),

          // Total Amount Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Amount:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff292929),
                  fontFamily: 'Courier Prime',
                ),
              ),
              Text(
                "\$${finalAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff292929),
                  fontFamily: 'Courier Prime',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
