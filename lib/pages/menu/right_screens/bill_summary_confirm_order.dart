import 'package:fluent_ui/fluent_ui.dart';

class BillSummaryDinein extends StatelessWidget {
  final double subTotal;



  const BillSummaryDinein({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    double tax = subTotal * 0.13; // 13% tax
    double discount = subTotal * 0.15; // 15% discount
    double finalAmount = subTotal + tax - discount;

    return Container(
      width: double.infinity, // Ensures full width
      padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust horizontal padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtotal Section
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF292929), // Border color (dark gray)
                  width: 1, // Border width
                ),
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
                      "Sub Total:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292929),
                      ),
                    ),
                    Text("\$${subTotal.toStringAsFixed(2)}"),
                  ],
                ),
                const SizedBox(height: 8),
                // Discount Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Discount:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292929),
                      ),
                    ),
                    Text("-\$${discount.toStringAsFixed(2)}"),
                  ],
                ),
                const SizedBox(height: 8),
                // Tax Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tax:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292929),
                      ),
                    ),
                    Text("\$${tax.toStringAsFixed(2)}"),
                  ],
                ),
              ],
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
                  fontWeight: FontWeight.w600,
                  color: Color(0xff292929),
                ),
              ),
              Text(
                "\$${finalAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff292929),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
