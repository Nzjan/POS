import 'package:fluent_ui/fluent_ui.dart';


class FoodItemCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAvatarTap; // Callback to handle avatar tap

  const FoodItemCard(
      {super.key, required this.item, required this.onAvatarTap});

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  bool isHovered = false;
  bool isAvatarHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        height: 219,
        width: 178,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isHovered
              ? Border.all(color: const Color(0xffAD6FE0), width: 1)
              : Border.all(color: Colors.transparent),
          boxShadow: isHovered
              ? [
            BoxShadow(
                color: const Color(0xffAD6FE0).withOpacity(0.5),
                blurRadius: 6)
          ]
              : [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.item['image'],
                  width: double.maxFinite,
                  height: 126,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.item['name'],
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Display image for Veg or Non-Veg based on the 'veg' value
                          Image.asset(
                            widget.item['veg']
                                ? 'assets/images/veg_nonveg/leaf.png' // Veg image
                                : 'assets/images/veg_nonveg/meat.png', // Non-Veg image
                            width: 20, // Set a width for the image
                            height: 20, // Set a height for the image
                          ),
                          const SizedBox(width: 6),
                          // Display text for Veg or Non-Veg
                          Text(
                            widget.item['veg'] ? "Veg" : "Non Veg",
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.item['veg']
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${widget.item['price'].toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => isAvatarHovered = true),
                    onExit: (_) => setState(() => isAvatarHovered = false),
                    child: CircleAvatar(
                      backgroundColor: isAvatarHovered
                          ? const Color(0xffAD6FE0)
                          : const Color(0xff292929),
                      child:  IconButton(
                        icon: const Icon(FluentIcons.add, color: Colors.white, size: 20),
                        onPressed: () {
                          // Show the dialog by pushing the new OrderFoodDialog widget
                          showDialog(
                            context: context,
                            builder: (context) => OrderFoodDialog(
                              item: widget.item,
                              initialQuantity: 1, // Or any other initial quantity logic
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class OrderFoodDialog extends StatefulWidget {
  final Map<String, dynamic> item;
  final int initialQuantity;

  const OrderFoodDialog({
    super.key,
    required this.item,
    required this.initialQuantity,
  });

  @override
  _OrderFoodDialogState createState() => _OrderFoodDialogState();
}

class _OrderFoodDialogState extends State<OrderFoodDialog> {
  late int quantity;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.item['category'] ?? "Unknown Category";

    return ContentDialog(
      title: Text(
        widget.item['name'],
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600, fontFamily: 'Lato'),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Item Category
              Text(
                "Category: $category",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff9d9d9d)),
              ),
              const SizedBox(height: 12),

              // Quantity Selector
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(FluentIcons.remove, size: 24),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(fontSize: 19.69, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(FluentIcons.add, size: 24),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Size Selector
              Row(
                children: [
                  const Text(
                    "Size:",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff9d9d9d)),
                  ),
                  const SizedBox(width: 24),
                  Row(
                    children: ["S", "M", "L", "XL"].map((size) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selectedSize == size ? Colors.black : const Color(0xff292929),
                              width: 2,
                            ),
                            color: selectedSize == size ? Colors.black : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(
                                color: selectedSize == size ? Colors.white : const Color(0xff292929),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Notes Section
              Container(
                height: 140,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: const Color(0xff999898), width: 0.7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Notes:", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xffadadad))),
                    const SizedBox(height: 6),
                    TextBox(
                      placeholder: "Type requirements here...",
                      maxLines: 4,
                      style: const TextStyle(fontSize: 14.0, color: Colors.black, height: 1.5),
                      decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.transparent)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Order Button
              SizedBox(
                width: double.infinity,
                child: Button(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color(0xFFAD6FE0)),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  child: const Text("Order"),
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}