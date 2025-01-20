import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//ljkhnfdkljgnkdfdfsdfsd
class OpeningCashDialog extends StatefulWidget {
  const OpeningCashDialog({Key? key}) : super(key: key);

  @override
  _OpeningCashDialogState createState() => _OpeningCashDialogState();
}

class _OpeningCashDialogState extends State<OpeningCashDialog> {
  TextEditingController openingCashController = TextEditingController(text: '\$ ');

  @override
  void initState() {
    super.initState();

    openingCashController.addListener(() {
      // Ensure the input always starts with '$' and applies the proper formatting
      if (openingCashController.text != '\$ ' && !openingCashController.text.startsWith('\$ ')) {
        openingCashController.text = '\$ ' + openingCashController.text.replaceFirst(RegExp(r'^\$'), '');
        openingCashController.selection = TextSelection.collapsed(offset: openingCashController.text.length);
      }
    });
  }

  // Function to format the entered number with commas
  String formatNumberWithCommas(String input) {
    // Remove any non-numeric characters, except for the decimal point
    String digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';

    // Format the digits with commas every 3 digits
    String result = '';
    int length = digits.length;
    int count = 0;
    for (int i = length - 1; i >= 0; i--) {
      result = digits[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = ',' + result;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 40),
        width: 625,
        height: 485,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Counter 1",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                          color: Color(0xFF00D03E),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Running",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ayusha Shrestha (Counter Person)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Opening Time:",
                          style: TextStyle(
                            color: Color(0xff818181),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "10:04",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "|",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "23-08-2024",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Cash input field
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 56,
                  width: 541,
                  padding: const EdgeInsets.only(left: 12, top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF969696), width: 0.6),
                  ),
                  child: TextField(
                    controller: openingCashController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        String formatted = formatNumberWithCommas(newValue.text);
                        return newValue.copyWith(text: formatted);
                      }),
                    ],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xFF333333),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      // hintText: '\$ 10,000', // The hint text will now show commas
                      // hintStyle: const TextStyle(
                      //   color: Color(0xFFB0B0B0),
                      //   fontSize: 16.0,
                      //   fontWeight: FontWeight.w400,
                      // ),
                    ),
                  ),
                ),
                Positioned(
                  top: -15,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.white,
                    child: const Text(
                      "Opening Cash (Opening Float)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF818181),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),
            // Notes input field
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 107,
                  width: 541,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF969696), width: 0.6),
                  ),
                  child: const TextField(
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF333333),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'this is the opening money.......',
                      hintStyle: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -15,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.white,
                    child: const Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF818181),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            // Submit Button
            Center(
              child: SizedBox(
                height: 45,
                width: 235,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFAD6FE0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  child: const Text("Submit", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog on Submit
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
