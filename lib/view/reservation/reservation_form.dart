import 'package:flutter/material.dart';

class ReservationForm extends StatelessWidget {
  const ReservationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24), // Rounded corners
      ),
      contentPadding: EdgeInsets.zero, // Zero padding inside the dialog box
      content: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 26),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24), // Rounded container
          ),
          width: 504,
          height: 736,
          child: Center(
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
                          "T-23",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929),
                          ),
                        ),
                        Text(
                          "Floor: 1",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff999898),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chair,
                          color: Color(0xff292929),
                          size: 24,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "2",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 29),
                _buildTextField(hintText: 'Notes'),
                const SizedBox(height: 26),
                _buildTextField(hintText: 'Phone no.'),
                const SizedBox(height: 26),
                _buildTextField(hintText: 'Advance Amount'),
                const SizedBox(height: 26),
                _buildDateTimeRow(),
                const SizedBox(height: 26),
                const Row(
                  children: [
                    Text(
                      "Guests:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2969696),
                      ),
                    ),
                    SizedBox(width: 21),
                    SizedBox(
                      width: 139,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.remove_circle_rounded,
                            color: Color(0xff292929),
                            size: 45,
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                          ),
                          Icon(
                            Icons.add_circle,
                            color: Color(0xff292929),
                            size: 45,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 26),
                _buildTextField(hintText: 'Special Requests'),
                const SizedBox(height: 48),
                SizedBox(
                  height: 45,
                  width: 196,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff292929),
                      backgroundColor: const Color(0xFFfafafa),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xFF292929), // Border color
                          width: 1, // Border width
                        ),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    child: const Text("Confirm Reservation"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return Container(
      height: 42,
      width: 432,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF969696), width: 0.6),
      ),
      child: TextField(
        maxLines: 5,
        style: const TextStyle(
          fontSize: 14.0, // Input text size
          color: Colors.black, // Input text color
        ),
        decoration: InputDecoration(
          hintText: hintText, // This is the placeholder text
          hintStyle: const TextStyle(
            color: Color(0xFF969696), // Placeholder text color
            fontSize: 14.0, // Placeholder text size
          ),
          border: InputBorder.none, // Removes the default border
          contentPadding: EdgeInsets.zero, // Removes extra padding
        ),
      ),
    );
  }

  Widget _buildDateTimeRow() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Date",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xff969696),
              ),
            ),
            Container(
              height: 37,
              width: 97,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF969696), width: 0.6),
              ),
              child: const TextField(
                maxLines: 1,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 74),
        Column(
          children: [
            const Text(
              "Time",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xff2969696),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 37,
                  width: 97,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF969696), width: 0.6),
                  ),
                  child: const TextField(
                    maxLines: 1,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                const SizedBox(width: 36),
                Container(
                  height: 37,
                  width: 93,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF969696), width: 0.6),
                  ),
                  child: const TextField(
                    maxLines: 1,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
