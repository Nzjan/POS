import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double buttonSpacing;

  PaymentMethod({
    this.buttonWidth = 90,
    this.buttonHeight = 62,
    this.buttonSpacing = 31,
  });

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  // Variable to track selected payment method (set 'Cash' by default)
  String? selectedMethod = 'Cash'; // Default to 'Cash'

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Payment Method",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Color(0xffadadad),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Row with consistent spacing between payment buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                PaymentButton(
                  icon: Icons.money,
                  label: 'Cash',
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  isSelected: selectedMethod == 'Cash',
                  onTap: () {
                    setState(() {
                      selectedMethod = 'Cash';
                    });
                  },
                ),
                SizedBox(width: widget.buttonSpacing),
                PaymentButton(
                  icon: Icons.credit_card,
                  label: 'Card',
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  isSelected: selectedMethod == 'Card',
                  onTap: () {
                    setState(() {
                      selectedMethod = 'Card';
                    });
                  },
                ),
                SizedBox(width: widget.buttonSpacing),
                PaymentButton(
                  icon: Icons.qr_code,
                  label: 'QR',
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  isSelected: selectedMethod == 'QR',
                  onTap: () {
                    setState(() {
                      selectedMethod = 'QR';
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double width;
  final double height;
  final bool isSelected;
  final VoidCallback onTap;

  PaymentButton({
    required this.icon,
    required this.label,
    required this.width,
    required this.height,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffead8f9) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xffad6fe0) : const Color(0xffB1BAC8),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? const Color(0xffad6fe0) : const Color(0xffB1BAC8),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isSelected ? const Color(0xffad6fe0) : const Color(0xffB1BAC8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
