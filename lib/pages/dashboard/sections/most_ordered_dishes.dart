import 'package:fluent_ui/fluent_ui.dart';

class MostOrderedDishes extends StatefulWidget {
  @override
  _MostOrderedDishesState createState() => _MostOrderedDishesState();
}

class _MostOrderedDishesState extends State<MostOrderedDishes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
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
              const Text(
                'Most Ordered Dishes',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3e3e3e),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle View All action
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Color(0xffaaaaaa), width: 1)),
                  ),
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffaaaaaa),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildDishItem(1, 'Chicken Biryani', 'Orders: 26',
                    'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(2, 'Double Crust Pizza', 'Orders: 23',
                    'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(3, 'Momo Combo x4', 'Orders: 20',
                    'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(4, 'Double Cheese Burger', 'Orders: 19',
                    'assets/images/recipe/burger/bacon_burger.jpeg'),
                _buildDishItem(5, 'Pineapple Pizza', 'Orders: 16',
                    'assets/images/recipe/burger/bacon_burger.jpeg'),
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            rank.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff969696),
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff818181),
                      ),
                    ),
                    TextSpan(
                      text: ' $number',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff585858),
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
