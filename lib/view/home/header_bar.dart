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
      //margin: EdgeInsets.only(left: 70.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onMenuTap,
                child: Container(
                  height: 37.h,
                  width: 36.w,
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(width: 0.6.w, color: const Color(0xffadadad)),
                  ),
                  child: const Icon(Iconsax.menu_1, color: Color(0xff3e3e3e)),
                ),
              ),
              SizedBox(width: 18.w),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
              // const Spacer(),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       _formatDate(DateTime.now()),
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 18.sp,
              //         fontFamily: 'Lato',
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     Text(
              //       _formatTime(DateTime.now()),
              //       style: TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14.sp,
              //         fontFamily: 'Lato',
              //         color: Colors.black,
              //       ),
              //     ),
              //   ],
              // )
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
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(dateTime);
  }
}
