import 'package:flutter/material.dart';
import 'package:RMS/login_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 458.h,
          width: 624.w,
          padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
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
                    padding:  EdgeInsets.only(right: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "My counter",
                          style: TextStyle(
                            color: Color(0xff969696),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                         SizedBox(height: 8.h),

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
                                       EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                                    ),
                                    fixedSize: MaterialStateProperty.all( Size(178.w, 71.h)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      side: BorderSide(
                                        color: isSelected
                                            ? const Color(0xffaaaaaa) // Border color for selected counter
                                            : const Color(0xffc0c0c0), // Black border color for unselected counters
                                        width: 1.w,
                                      ),
                                    )),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                    textStyle: MaterialStateProperty.all( TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        counter['name'],
                                        style:  TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                       SizedBox(height: 6.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 10.sp,
                                            color: counter['status'] == 'Active'
                                                ? const Color(0xFF00D03E) // Active icon color
                                                : const Color(0xff818181), // Inactive icon color
                                          ),
                                           SizedBox(width: 6.w),
                                          Text(
                                            counter['status'],
                                            style:  TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                 SizedBox(height: 16.h), // Gap between buttons
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
                    padding:  EdgeInsets.only(top: 50.h, bottom: 49.h, left: 57.w, right: 73.w),
                    decoration:  BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color(0xffc0c0c0),
                          width: 1.w,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedCounter.isEmpty ? '' : ' $selectedCounter', // Display selected counter name
                          style:  TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         SizedBox(height: 64.h),
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
