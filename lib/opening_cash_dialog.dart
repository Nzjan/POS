import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      if (openingCashController.text != '\$ ' && !openingCashController.text.startsWith('\$ ')) {
        openingCashController.text = '\$ ' + openingCashController.text.replaceFirst(RegExp(r'^\$'), '');
        openingCashController.selection = TextSelection.collapsed(offset: openingCashController.text.length);
      }
    });
  }

  String formatNumberWithCommas(String input) {
    String digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';
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
        padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 40.h), // Use ScreenUtil for padding
        width: 625.w, // Width using ScreenUtil
        height: 485.h, // Height using ScreenUtil
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r), // Rounded corners using ScreenUtil
        ),
        child: SingleChildScrollView( // Wrap content in a scrollable view
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header Row (Counter Status & Info)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Counter 1",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 32.sp, // Use responsive font size
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10.sp, // Responsive icon size
                            color: Color(0xFF00D03E),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Running",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14.sp, // Responsive font size
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
                          fontSize: 16.sp, // Responsive font size
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            "Opening Time: ",
                            style: TextStyle(
                              color: Color(0xff818181),
                              fontSize: 14.sp, // Responsive font size
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "10:04",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16.sp, // Responsive font size
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text("|", style: TextStyle(color: Color(0xff333333))),
                          SizedBox(width: 6.w),
                          Text("23-08-2024",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16.sp, // Responsive font size
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // Opening Cash Input Field
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 56.h,
                    width: 541.w,
                    padding: EdgeInsets.only(left: 12.w, top: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r), // Responsive border radius
                      border: Border.all(color: const Color(0xFF969696), width: 0.6.w),
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
                      style: TextStyle(
                        fontSize: 16.sp, // Responsive font size
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
                        color: Color(0xFF333333),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15.h,
                    left: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      color: Colors.white,
                      child:  Text(
                        "Opening Cash (Opening Float)",
                        style: TextStyle(
                          fontSize: 16.sp, // Responsive font size
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 42.h),

              // Notes Input Field
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 107.h,
                    width: 541.w,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r), // Responsive border radius
                      border: Border.all(color: const Color(0xFF969696), width: 0.6.w),
                    ),
                    child:  TextField(
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 16.sp, // Responsive font size
                        color: Color(0xFF333333),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'This is the opening money.......',
                        hintStyle: TextStyle(
                          color: Color(0xFFB0B0B0),
                          fontSize: 16.sp, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15.h,
                    left: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      color: Colors.white,
                      child:  Text(
                        "Notes",
                        style: TextStyle(
                          fontSize: 16.sp, // Responsive font size
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 45.h),

              // Submit Button
              Center(
                child: SizedBox(
                  height: 45.h,
                  width: 235.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFAD6FE0),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), // Responsive border radius
                      textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700), // Responsive font size
                    ),
                    child:  Text("Submit", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
