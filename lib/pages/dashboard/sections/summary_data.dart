import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:fluent_ui/fluent_ui.dart';

class SummaryData extends StatefulWidget {
  const SummaryData({super.key});

  @override
  _SummaryDataState createState() => _SummaryDataState();
}

class _SummaryDataState extends State<SummaryData> {
  // Example data for total menus, sales, orders, and customers
  final String totalOrders = '128'; // This is the actual value
  final String covers = '150'; // Another example actual value
  final String netSales = '3500'; // Actual net sales value

  // Example percent change data (positive or negative percentages)
  final String totalOrdersPercent = '-12.5'; // Example: negative percent value
  final String coversPercent = '+8.2'; // Example: positive percent value
  final String netSalesPercent = '+5.0'; // Example: positive percent value

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _summaryContainer(
          value: totalOrders,
          percentvalue: totalOrdersPercent,
          title: 'Total Orders',
          subtitle: ' than yesterday',
          imageUrl: 'assets/images/dashboard_icons/total_orders.png',
          iconBoxColor: const Color(0xff3958F0),
        ),
        _summaryContainer(
          value: covers,
          percentvalue: coversPercent,
          title: 'Guests',
          subtitle: ' than yesterday',
          imageUrl: 'assets/images/dashboard_icons/guests.png',
          iconBoxColor: const Color(0xff35c2cc),
        ),
        _summaryContainer(
          value: netSales,
          percentvalue: netSalesPercent,
          title: 'Net Sales',
          subtitle: ' than yesterday',
          imageUrl: 'assets/images/dashboard_icons/net_sales.png',
          iconBoxColor: const Color(0xff00c35e),
        ),
      ],
    );
  }

  Widget _summaryContainer({
    required String value,
    required String percentvalue,
    required String title,
    required String subtitle,
    required String imageUrl,
    required Color iconBoxColor,
  }) {

    double percent = double.tryParse(percentvalue) ?? 0;

    Color percentColor =
    percent >= 0 ? const Color(0xff00b40c) : const Color(0xffdd00000);
    String percentText =
        '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(1)}%';

    return Stack(
      children: [
        // The main container that holds text and other content
        Container(
          height: 97.h, // Using ScreenUtil for responsive height
          width: 214.w, // Using ScreenUtil for responsive width
          padding:
          EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w, bottom: 8.h), // Using ScreenUtil for responsive padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r), // Responsive border radius
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2.r,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: 24.sp, // Responsive font size
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                  fontSize: 12.sp, // Responsive font size
                  color: const Color(0xff818181),
                ),
              ),
              SizedBox(height: 3.h), // Responsive height for spacing
              Row(
                children: [
                  Text(
                    percentText,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                      fontSize: 8.sp, // Responsive font size
                      color: percentColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      fontSize: 8.sp, // Responsive font size
                      color: const Color(0xff969696),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Positioned small container with image
        Positioned(
          top: 8.h, // Responsive top position
          right: 8.w, // Responsive right position
          child: Container(
            width: 32.w, // Responsive width
            height: 32.h, // Responsive height
            decoration: BoxDecoration(
              color: iconBoxColor,
              borderRadius: BorderRadius.circular(16.r), // Responsive border radius
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r), // Responsive border radius
              child: Image.asset(
                imageUrl,
                width: 16.w, // Responsive width for the image
                height: 16.h, // Responsive height for the image
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
