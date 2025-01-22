import 'package:RMS/pages/menu/right_screens/right.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:RMS/pages/menu/middle_screens/category_section.dart';
import 'middle_screens/food_item_grid.dart';
import 'middle_screens/table_running_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedCategory = 'Burger';
  List<int> hoveredCards = [];
  List<int> filteredTables = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 96),
      child: Row(
        children: [
          // Expanded Column: Takes most of the space
          Expanded(
            child: Column(
              children: [
                // Category Section
                CategorySection(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
                // Food Item Grid
                Expanded(
                  child: FoodItemGrid(
                    selectedCategory: selectedCategory,
                  ),
                ),

                Container(
                  height: 70,
                  padding: const EdgeInsets.all(14),
                  color:  Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(filteredTables.length, (index) {
                          bool isSelected = hoveredCards.contains(index);  // Determine if the current card is selected

                          return MouseRegion(
                            onEnter: (_) => setState(() => hoveredCards.add(index)),
                            onExit: (_) => setState(() => hoveredCards.remove(index)),
                            child: TableRunningCard(
                              isSelected: isSelected, // Pass isSelected dynamically
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Fixed Width Container Column: 350px width for order section
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30,),
            width: 350,
            child: const OrderSection(),
          ),
        ],
      ),
    );
  }
}
