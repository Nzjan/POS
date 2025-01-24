import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:fluent_ui/fluent_ui.dart';

class UpcomingReservations extends StatefulWidget {
  @override
  _UpcomingReservationsState createState() => _UpcomingReservationsState();
}

class _UpcomingReservationsState extends State<UpcomingReservations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 393.h, // Using ScreenUtil for height
      padding: EdgeInsets.all(16.w), // Using ScreenUtil for padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Using ScreenUtil for border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.r, // Responsive blur radius
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Reservations',
                style: TextStyle(
                  fontSize: 21.sp, // Responsive font size
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3e3e3e),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xffaaaaaa), width: 1)),
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 10.sp, // Responsive font size
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffaaaaaa),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h), // Responsive height for spacing
          // Title Row with Dividers
           Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Reservation No.',
                    style: TextStyle(
                      fontSize: 12.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Color(0xffaaaaaa),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Guest Name',
                    style: TextStyle(
                      fontSize: 12.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Color(0xffaaaaaa),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Guest No.',
                    style: TextStyle(
                      fontSize: 12.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Color(0xffaaaaaa),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 12.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Color(0xffaaaaaa),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Duration',
                    style: TextStyle(
                      fontSize: 12.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Color(0xffaaaaaa),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Data Rows
          Expanded(
            child: ListView.builder(
              itemCount: 7, // Adjust number of items as per requirement
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h), // Responsive vertical spacing
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'R-1004',
                          style: TextStyle(
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff3e3e3e),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Jin Woo',
                          style: TextStyle(
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff3e3e3e),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff3e3e3e),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '1:00 pm - 2:00 pm',
                          style: TextStyle(
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff3e3e3e),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                       Expanded(
                        flex: 2,
                        child: Text(
                          '45:33',
                          style: TextStyle(
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
