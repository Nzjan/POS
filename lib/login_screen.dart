import 'package:flutter/material.dart';
import 'package:RMS/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCounter = 'Counter 1'; // By default, Counter 1 is selected

  // List of counters with status and colors
  final List<Map<String, dynamic>> counters = [
    {
      'name': 'Counter 1',
      'status': 'Inactive',
      'color': const Color(0xff818181),
      'isRunning': false,
    },
    {
      'name': 'Counter 2',
      'status': 'Active',
      'color': const Color(0xFF00D03E),
      'isRunning': true,
    },
    {
      'name': 'Counter 3',
      'status': 'Inactive',
      'color': const Color(0xff818181),
      'isRunning': false,
    },

  ];

  // Method to handle counter selection
  void selectCounter(String counterName) {
    setState(() {
      selectedCounter = counterName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161a23),
      body: Center(
        child: Container(
          height: 458,
          width: 624,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Column (Counter + Button)
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My counter",
                          style: TextStyle(
                            color: Color(0xff969696),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Other Counters (no divider and no reordering)
                        Column(
                          children: counters.map((counter) {
                            // Check if this counter is selected, to highlight it
                            bool isSelected = selectedCounter == counter['name'];
                            return Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () => selectCounter(counter['name']),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      isSelected
                                          ? const Color(0xFFDABFF3) // Use selected counter color
                                          : const Color(0xFFfdfeff), // Default color for unselected counters
                                    ),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                                    ),
                                    fixedSize: MaterialStateProperty.all(const Size(178, 71)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: isSelected
                                            ? const Color(0xffaaaaaa) // Border color for selected counter
                                            : const Color(0xffc0c0c0), // Black border color for unselected counters
                                        width: 1,
                                      ),
                                    )),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                    textStyle: MaterialStateProperty.all(const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        counter['name'],
                                        style: const TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: counter['status'] == 'Active'
                                                ? const Color(0xFF00D03E) // Active icon color
                                                : const Color(0xff818181), // Inactive icon color
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            counter['status'],
                                            style: const TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16), // Gap between buttons
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                // Second Column (Login Form)
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(top: 50, bottom: 49, left: 57, right: 73),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color(0xffc0c0c0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedCounter.isEmpty ? '' : ' $selectedCounter', // Display selected counter name
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 64),
                        const LoginForm(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
