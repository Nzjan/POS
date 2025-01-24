import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color _buttonColor1 = const Color(0xFFfafafa);
  Color _buttonColor2 = const Color(0xFFfafafa);
  Color _buttonColor3 = const Color(0xFFAD6FE0);

  void _onHover(PointerEvent details, int buttonIndex) {
    setState(() {
      if (buttonIndex == 1) {
        _buttonColor1 = details is PointerEnterEvent ? const Color(0xFFC0C0C0) : const Color(0xFFfafafa);
      } else if (buttonIndex == 2) {
        _buttonColor2 = details is PointerEnterEvent ? const Color(0xFFC0C0C0) : const Color(0xFFfafafa);
      } else {
        _buttonColor3 = details is PointerEnterEvent ? const Color(0xFFC092EF) : const Color(0xFFAD6FE0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 24.w, right: 30.w), // Use ScreenUtil for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Counter Name",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Amrita Shrestha (Counter Person)",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Opening Time:",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff818181)),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "10:04 | 23-08-2024",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff333333)),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    MouseRegion(
                      onEnter: (details) => _onHover(details, 1),
                      onExit: (details) => _onHover(details, 1),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(_buttonColor1),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w)), // Use ScreenUtil for padding
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r), // Use ScreenUtil for radius
                            side: const BorderSide(
                              color: Color(0xFF292929),
                              width: 1,
                            ),
                          )),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)), // Use ScreenUtil for text size
                        ),
                        onPressed: () {},
                        child: const Text("Close Movement"),
                      ),
                    ),
                    SizedBox(width: 20.w), // Use ScreenUtil for spacing
                    MouseRegion(
                      onEnter: (details) => _onHover(details, 2),
                      onExit: (details) => _onHover(details, 2),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(_buttonColor2),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: const BorderSide(
                              color: Color(0xFF292929),
                              width: 1,
                            ),
                          )),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)),
                        ),
                        onPressed: () {},
                        child: const Text("Register History"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 21.h), // Use ScreenUtil for spacing
            Container(
              padding: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFF969696), width: 1.w),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6.r),
                        topLeft: Radius.circular(6.r),
                      ),
                      border: const Border(
                        bottom: BorderSide(color: Color(0xFFc0c0c0), width: 1),
                      ),
                      color: const Color(0xffe3e3e3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Expected Cash in the Register",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "\$ 32,000",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "Opening float",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Cash Sales",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Cash Refunds",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Cash Out",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Cash In",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Cash Sales",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "\$ 12,000",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "\$ 22,000",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "-",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "-",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "-",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff585858),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFF969696), width: 0.6.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Counted Cash in the Register",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "\$ 29,000",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.h),
            const Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff333333),
                        ),
                      ),
                      Text(
                        "Difference",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff585858),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$ 32,000",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff333333),
                        ),
                      ),
                      Text(
                        "\$ 1,000",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 107.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: const Color(0xFF969696), width: 0.6.w),
                  ),
                  child:  TextField(
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Positioned(
                  top: -10.h,
                  left: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    color: Colors.white,
                    child:  Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF818181),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Center(
              child: SizedBox(
                height: 45.h,
                width: 259.w,
                child: MouseRegion(
                  onEnter: (details) => _onHover(details, 3),
                  onExit: (details) => _onHover(details, 3),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_buttonColor3),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)),
                    ),
                    onPressed: () {
                      // Button press functionality
                    },
                    child: const Text("Cash Register"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
