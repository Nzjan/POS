import 'package:RMS/pages/header_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
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
  //   // Show the dialog after a delay
  //   Future.delayed(const Duration(seconds: 1), () {
  //     if (mounted) {
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (context) {
  //           return const OpeningCashDialog(); // Show the custom dialog
  //         },
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xffecf0f3),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          // GestureDetector wrapping the entire screen to detect taps anywhere outside the drawer
          GestureDetector(
            onTap: () {
              if (isDrawerExpanded) {
                toggleDrawer(); // Close the drawer when tapping anywhere outside.
              }
            },
            child: Row(
              children: [
                // Main content area (it stays unaffected by the drawer)
                Expanded(
                  child: Column(
                    children: [
                      //Header Bar
                      HeaderBar(
                        title: _getPageTitle(selectedPageIndex),
                        onMenuTap: toggleDrawer, // Toggles drawer on menu tap.
                        selectedPageIndex: selectedPageIndex,
                      ),

                      // The actual page content
                      Expanded(
                        child: _getPageContent(selectedPageIndex),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Drawer container (overlay on top of the main content)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1),
            left: 0,
            top: 0,
            width: isDrawerExpanded ? 221 : 72,
            // Expanded or collapsed width.
            child: GestureDetector(
              onTap: () {
                // This will reset the selection when tapping outside
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
                          ? Colors.white // White icon when selected
                          : const Color(0xFF8A8C91), // Default icon color
                    ),
                    if (isDrawerExpanded) ...[
                      const SizedBox(width: 16), // Space between icon and text
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelectedMain
                              ? Colors.white // White text when selected
                              : const Color(0xFF8A8C91), // Default text color
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

  // Sidebar Section Header with color change when selected
  Widget _buildSidebarHeader(String title) {
    return GestureDetector(
      onTap: () {
        // Toggle the selection on tap (simulating selection change)
        setState(() {
          isSelectedHeader = !isSelectedHeader;
        });
      },
      child: Column(
        children: [
          // Main menu container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isSelectedHeader ? const Color(0xFF2D2F39) : null,
              // Background color change when selected
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Iconsax.notification, // Notification icon
                  size: 24,
                  color: isSelectedHeader ? Colors.white : const Color(
                      0xFF8A8C91), // Icon color change when selected
                ),
                if (isDrawerExpanded) ...[
                  const SizedBox(width: 16), // Space between icon and text
                  Text(
                    title, // Use the passed title for the text
                    style: TextStyle(
                      color: isSelectedHeader ? Colors.white : const Color(
                          0xFF8A8C91), // Text color change when selected
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


  // Header Section with Logo
  Widget _buildLogoRow() {
    return Container(
      height: 68,
      decoration: const BoxDecoration(
        color: Color(0xFF2D2F39),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(12),
        //   topRight: Radius.circular(12),
        // ),
        // border: Border(
        //   bottom: BorderSide(
        //     color: Color(0xFF8B8B8B),
        //     width: 2,
        //   ),
        // ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 17, // Keep a fixed distance from the left side
            top: 17, // Adjust to position the logo vertically
            child: GestureDetector(
              //onTap: toggleSidebar, // Toggle sidebar when the logo is clicked
              child: SizedBox(
                width: 30, // Fixed logo width
                height: 30, // Fixed logo height
                child: Image.asset(
                  'assets/pos_logo.png', // Replace with your logo path
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Theme Toggle (Bottom Section)
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
                width: 45, // Set width and height to 45 for the circular area
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
                    'assets/chef.png', // Replace with your image path
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover, // Ensure the image fills the circle
                  ),
                ),
              ),
              if (isDrawerExpanded) ...[
                const SizedBox(width: 12), // Space between icon and text
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Amrita Shrestha",
                      style: TextStyle(
                          color: Color(0xFFc0c0c0), // Default text color
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      "Counter 1",
                      style: TextStyle(
                          color: Color(0xFF969696), // Default text color
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
        return const TablePage();
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