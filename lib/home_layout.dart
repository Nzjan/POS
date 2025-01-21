import 'package:RMS/main.dart';
import 'package:RMS/pages/header_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'login_screen.dart';
import 'opening_cash_dialog.dart';
// drawer items import
import 'package:RMS/pages/dashboard/dashboard_page.dart';
import 'package:RMS/pages/table/table_page.dart';
import 'package:RMS/pages/menu/menu_page.dart';
import 'package:RMS/pages/order_list/order_list_page.dart';
import 'package:RMS/pages/reservation/reservation_page.dart';
import 'package:RMS/pages/register/register_page.dart';

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
    return Container(

      padding: EdgeInsets.zero,
      child: Stack(
        children: [

          GestureDetector(
            onTap: () {
              if (isDrawerExpanded) {
                toggleDrawer();
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      //Header Bar
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
              ],
            ),
          ),


          AnimatedPositioned(
            duration: const Duration(milliseconds: 1),
            left: 0,
            top: 0,
            width: isDrawerExpanded ? 221 : 72,
            // Expanded or collapsed width.
            child: GestureDetector(
              onTap: () {

                if (isSelectedHeader) {
                  setState(() {
                    isSelectedHeader = false;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF161A23),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: _buildLogoRow(),
                    ),
                    // Drawer items
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
                    const SizedBox(height: 40,),

                    _buildSidebarHeader("Notification"),
                    // Bottom section: Theme toggle
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: _buildBottomRow(),
                    ),
                  ],
                ),
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
          // Main menu container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isSelectedMain ? const Color(0xFF2D2F39) : null,

              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 24,
                      color: isSelectedMain
                          ? Colors.white
                          : const Color(0xFF8A8C91),
                    ),
                    if (isDrawerExpanded) ...[
                      const SizedBox(width: 16),
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelectedMain
                              ? Colors.white
                              : const Color(0xFF8A8C91),
                          fontSize: 14,
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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isSelectedHeader ? const Color(0xFF2D2F39) : null,

              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Iconsax.notification,
                  size: 24,
                  color: isSelectedHeader ? Colors.white : const Color(0xFF8A8C91),
                ),
                if (isDrawerExpanded) ...[
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelectedHeader ? Colors.white : const Color(0xFF8A8C91),
                      fontSize: 14,
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
      height: 68,
      color: const Color(0xFF2D2F39),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  'assets/pos_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          if (isDrawerExpanded) ...[
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),
                  );
                },
                child: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomRow() {
    return
      Container(
          height: 76,
          padding: const EdgeInsets.only(top: 15, bottom: 16, left: 12,),
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
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF2D2F39), // Border color
                    width: 0.78, // Border width
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/chef.png',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isDrawerExpanded) ...[
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Amrita Shrestha",
                      style: TextStyle(
                          color: Color(0xFFc0c0c0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      "Counter 1",
                      style: TextStyle(
                          color: Color(0xFF969696),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                )
              ],
            ],
          )
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
        return const DashboardPage();
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