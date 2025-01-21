import 'package:fluent_ui/fluent_ui.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final VoidCallback onMenuTap;
  final int selectedPageIndex;
  final int? selectedSubPageIndex;

  const HeaderBar({
    super.key,
    required this.title,
    required this.onMenuTap,
    required this.selectedPageIndex,
    this.selectedSubPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 72.w), // Responsive margin
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onMenuTap,
                child: Container(
                  height: 37.h, // Responsive height
                  width: 36.w, // Responsive width
                  padding: EdgeInsets.all(8.w), // Responsive padding
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(9.r), // Responsive border radius
                    border: Border.all(width: 0.6.w, color: const Color(0xffadadad)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff5c5c5c).withOpacity(0.5),
                        blurRadius: 12.0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: const Icon(Iconsax.menu_1, color: Color(0xff3e3e3e)),
                ),
              ),
              SizedBox(width: 24.w), // Responsive spacing
              Expanded(
                child: Container(
                  height: 46.h, // Responsive height
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h), // Responsive padding
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(21.r), // Responsive border radius
                    border: Border.all(width: 0.6.w, color: const Color(0xffadadad)),
                  ),
                  child: Row(
                    children: [
                       Icon(
                        FluentIcons.search_art64,
                        color: Color(0xff3e3e3e),
                        size: 18.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextBox(
                          padding: EdgeInsets.symmetric(horizontal: 0.0.w, vertical: 0.3.h),
                          placeholder: 'Let\'s cook food',
                          placeholderStyle: TextStyle(
                            fontSize: 12.sp, // Responsive font size
                            color: const Color(0xff3e3e3e),
                            fontWeight: FontWeight.bold,
                          ),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.transparent),
                          ),
                          foregroundDecoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _formatDate(DateTime.now()),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _formatTime(DateTime.now()),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm a'); // 12-hour format with AM/PM
    return formatter.format(dateTime);
  }
}
