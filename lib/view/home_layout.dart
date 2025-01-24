import 'package:RMS/view/dashboard/dashboard_page.dart';
import 'package:RMS/view/header_bar.dart';
import 'package:RMS/view/menu/menu_page.dart';
import 'package:RMS/view/order_list/order_list_page.dart';
import 'package:RMS/view/register/register_page.dart';
import 'package:RMS/view/reservation/reservation_page.dart';
import 'package:RMS/view/table/table_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_screen.dart';



class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isDrawerExpanded = false;
  int selectedPageIndex = 0;
  bool isSelectedHeader = false;

  void toggleDrawer() {
    setState(() {
      isDrawerExpanded = !isDrawerExpanded;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //
  //   Future.delayed(const Duration(seconds: 0), () {
  //     if (mounted) {
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (context) {
  //           return const OpeningCashDialog();
  //         },
  //       );
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            width: isDrawerExpanded ? 221.w : 70.w,
            color: const Color(0xFF161A23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: _buildLogoRow(),
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.house,
                  label: 'Dashboard',
                  index: 0,
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.chair,
                  label: 'Table',
                  index: 1,
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.list,
                  label: 'Menu',
                  index: 2,
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.firstOrder,
                  label: 'Order List',
                  index: 3,
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.calendar,
                  label: 'Reservation',
                  index: 4,
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.registered,
                  label: 'Register',
                  index: 5,
                ),
                const Spacer(),
                _buildSidebarHeader("Notification"),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: _buildBottomRow(),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (isDrawerExpanded) {
                  toggleDrawer();
                }
              },
              child: Column(
                children: [
                  HeaderBar(
                    title: _getPageTitle(selectedPageIndex),
                    onMenuTap: toggleDrawer,
                    selectedPageIndex: selectedPageIndex,
                  ),
                  Expanded(
                    child: _getPageContent(selectedPageIndex),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelectedMain = selectedPageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPageIndex = index;
        });
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelectedMain ? const Color(0xFF2D2F39) : null,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 24.sp,
                      color: isSelectedMain
                          ? Colors.white
                          : const Color(0xFF8A8C91),
                    ),
                    if (isDrawerExpanded) ...[
                      SizedBox(width: 16.w),
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelectedMain
                              ? Colors.white
                              : const Color(0xFF8A8C91),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarHeader(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelectedHeader = !isSelectedHeader;
        });
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelectedHeader ? const Color(0xFF2D2F39) : null,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Iconsax.notification,
                  size: 24.sp,
                  color: isSelectedHeader ? Colors.white : const Color(0xFF8A8C91),
                ),
                if (isDrawerExpanded) ...[
                  SizedBox(width: 16.w),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelectedHeader ? Colors.white : const Color(0xFF8A8C91),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoRow() {
    return Container(
      height: 68.h,
      color: const Color(0xFF2D2F39),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: GestureDetector(
              child: SizedBox(
                width: 30.w,
                height: 30.h,
                child: Image.asset(
                  'assets/pos_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          if (isDrawerExpanded) ...[
            Padding(
              padding: EdgeInsets.only(right: 17.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),
                  );
                },
                child:  Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomRow() {
    return Container(
      height: 76.h,
      padding: EdgeInsets.only(top: 15.h, bottom: 16.h, left: 12.w),
      decoration: const BoxDecoration(
        color: Color(0xFF161a23),
        border: Border(
          top: BorderSide(color: Color(0xFF2D2F39), width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF2D2F39),
                width: 0.78.w,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/chef.png',
                width: 45.w,
                height: 45.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isDrawerExpanded) ...[
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amrita Shrestha",
                  style: TextStyle(
                      color: const Color(0xFFc0c0c0),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Counter 1",
                  style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Table';
      case 2:
        return 'Menu';
      case 3:
        return 'Order List';
      case 4:
        return 'Reservation';
      case 5:
        return 'Register';
      default:
        return 'Dashboard';
    }
  }

  Widget _getPageContent(int selectedPageIndex,) {
    switch (selectedPageIndex) {
      case 0:
        return const MenuPage();
      case 1:
        return const TablePage();
      case 2:
        return const MenuPage();
      case 3:
        return const OrderListPage();
      case 4:
        return  const ReservationPage();
      case 5:
        return const RegisterPage();
      default:
        return const DashboardPage();
    }
  }
}
