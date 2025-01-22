
import 'package:fluent_ui/fluent_ui.dart';

class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategorySection({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment:
          Alignment.topLeft,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // First Row: "Category" text
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 12,
              height: 1.17,
              fontWeight: FontWeight.w700,
              color: Color(0xff858585),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategorySelector(
                  imagePath: 'assets/images/categorycard/burger.png',
                  label: "Burger",
                  itemsCount: 8,
                  onTap: () {
                    onCategorySelected("Burger");
                  },
                  isSelected: selectedCategory == "Burger",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/pizza.png',
                  label: "Pizza",
                  itemsCount: 16,
                  onTap: () {
                    onCategorySelected("Pizza");
                  },
                  isSelected: selectedCategory == "Pizza",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/wine.png',
                  label: "Wine",
                  itemsCount: 5,
                  onTap: () {
                    onCategorySelected("Wine");
                  },
                  isSelected: selectedCategory == "Wine",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/juice.png',
                  label: "Juice",
                  itemsCount: 8,
                  onTap: () {
                    onCategorySelected("Juice");
                  },
                  isSelected: selectedCategory == "Juice",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/coffee.png',
                  label: "Coffee",
                  itemsCount: 8,
                  onTap: () {
                    onCategorySelected("Coffee");
                  },
                  isSelected: selectedCategory == "Coffee",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/dessert.png',
                  label: "Dessert",
                  itemsCount: 16,
                  onTap: () {
                    onCategorySelected("Dessert");
                  },
                  isSelected: selectedCategory == "Dessert",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/Platter.png',
                  label: "Platter",
                  itemsCount: 16,
                  onTap: () {
                    onCategorySelected("Platter");
                  },
                  isSelected: selectedCategory == "Platter",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/Special.png',
                  label: "Special",
                  itemsCount: 16,
                  onTap: () {
                    onCategorySelected("Special");
                  },
                  isSelected: selectedCategory == "Special",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/Rammen.png',
                  label: "Rammen",
                  itemsCount: 16,
                  onTap: () {
                    onCategorySelected("Rammen");
                  },
                  isSelected: selectedCategory == "Rammen",
                ),
                CategorySelector(
                  imagePath: 'assets/images/categorycard/Soup.png',
                  label: "Soup",
                  itemsCount: 16,
                  onTap: () {
                    onCategorySelected("Soup");
                  },
                  isSelected: selectedCategory == "Soup",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  final String imagePath;
  final String label;
  final int itemsCount;
  final VoidCallback onTap;
  final bool isSelected; // New property to check if selected

  const CategorySelector({
    super.key,
    required this.imagePath,
    required this.label,
    required this.itemsCount,
    required this.onTap,
    required this.isSelected, // Initialize the new property
  });

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  bool isHovered = false; // Track hover state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            width: 92,
            height: 80,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: widget.isSelected ? const Color(0xfff4ebfc) : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: (isHovered || widget.isSelected)
                  ? Border.all(color: const Color(0xffAD6FE0), width: 1)
                  : Border.all(color: Colors.transparent),
              boxShadow: (isHovered || widget.isSelected)
                  ? [
                      BoxShadow(
                        color: const Color(0xffAD6FE0).withOpacity(0.5),
                        blurRadius: 6,
                        offset: const Offset(0, 0),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 0),
                      ),
                    ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagePath,
                  height: 18,
                  width: 18,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.label,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff292929)),
                ),
                Text(
                  '${widget.itemsCount} items',
                  style:
                      const TextStyle(color: Color(0xff525252), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
