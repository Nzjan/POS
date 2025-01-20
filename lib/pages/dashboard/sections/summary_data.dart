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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    // Convert percentvalue to double
    double percent = double.tryParse(percentvalue) ?? 0;

    // Determine color based on percent value
    Color percentColor =
        percent >= 0 ? const Color(0xff00b40c) : const Color(0xffdd00000);
    String percentText =
        '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(1)}%';

    return Stack(
      children: [
        // The main container that holds text and other content
        Container(
          height: 97,
          width: 214,
          padding:
              const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                  fontSize: 12,
                  color: Color(0xff818181),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    percentText,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                      fontSize: 8,
                      color: percentColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      fontSize: 8,
                      color: Color(0xff969696),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Positioned small container with image
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconBoxColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                width: 16,
                height: 16,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
