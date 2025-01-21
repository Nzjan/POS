import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:fluent_ui/fluent_ui.dart';

class MostOrderedDishes extends StatefulWidget {
  @override
  _MostOrderedDishesState createState() => _MostOrderedDishesState();
}

class _MostOrderedDishesState extends State<MostOrderedDishes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354.h, // Using ScreenUtil for height
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h), // Using ScreenUtil for padding
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
                'Most Ordered Dishes',
                style: TextStyle(
                  fontSize: 21.sp, // Responsive font size
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3e3e3e),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle View All action
                },
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
              ),
            ],
          ),
          SizedBox(height: 16.h), // Responsive height for spacing
          Expanded(
            child: ListView(
              children: [
                _buildDishItem(1, 'Chicken Biryani', 'Orders: 26', 'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(2, 'Double Crust Pizza', 'Orders: 23', 'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(3, 'Momo Combo x4', 'Orders: 20', 'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(4, 'Double Cheese Burger', 'Orders: 19', 'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(5, 'Pineapple Pizza', 'Orders: 16', 'assets/images/recipe/burger/bacon_burger.jpeg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDishItem(int rank, String title, String subtitle, String imagePath) {
    final parts = subtitle.split(':');
    final label = parts[0] + ":";
    final number = parts.length > 1 ? parts[1] : '';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h), // Responsive vertical spacing
      child: Row(
        children: [
          Text(
            rank.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 20.sp, // Responsive font size
              fontWeight: FontWeight.w700,
              color: const Color(0xff969696),
            ),
          ),
          SizedBox(width: 16.w), // Responsive width spacing
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r), // Responsive border radius
            child: Image.asset(
              imagePath,
              width: 40.w, // Responsive width for image
              height: 40.h, // Responsive height for image
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w), // Responsive width spacing
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp, // Responsive font size
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff000000),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: TextStyle(
                        fontSize: 14.sp, // Responsive font size
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff818181),
                      ),
                    ),
                    TextSpan(
                      text: ' $number',
                      style: TextStyle(
                        fontSize: 14.sp, // Responsive font size
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff585858),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
