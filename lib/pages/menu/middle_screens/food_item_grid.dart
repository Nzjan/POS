import 'package:RMS/pages/menu/middle_screens//food_item_card.dart';
import 'package:RMS/services/dio_service.dart';
import 'package:RMS/services/shared_preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FoodItemGrid extends StatefulWidget {
  final String selectedCategory;

  const FoodItemGrid({
    super.key,
    required this.selectedCategory,
    // required this.onOrder,
  });

  @override
  State<FoodItemGrid> createState() => _FoodItemGridState();
}

class _FoodItemGridState extends State<FoodItemGrid> {
  Map<String, List<Map<String, dynamic>>> categoryItems = {};

  // final Map<String, List<Map<String, dynamic>>> categoryItems = {
  //   "Pizza": [
  //     {
  //       "name": "Margherita Pizza",
  //       "price": 10.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/pizza/margherita.jpeg'
  //     },
  //     {
  //       "name": "Pepperoni Pizza",
  //       "price": 12.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/pizza/pepperoni.png'
  //     },
  //     {
  //       "name": "BBQ Chicken Pizza",
  //       "price": 13.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/pizza/bbq_chicken.jpeg'
  //     },
  //     {
  //       "name": "Hawaiian Pizza",
  //       "price": 11.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/pizza/hawaiian.jpg'
  //     },
  //     {
  //       "name": "Veggie Pizza",
  //       "price": 9.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/pizza/veggie.jpeg'
  //     },
  //     {
  //       "name": "Four Cheese Pizza",
  //       "price": 14.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/pizza/cheese.jpg'
  //     },
  //     {
  //       "name": "Meat Lovers Pizza",
  //       "price": 15.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/pizza/meat_lovers.jpeg'
  //     },
  //     {
  //       "name": "Spinach & Feta Pizza",
  //       "price": 12.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/pizza/spinach_feta.jpeg'
  //     },
  //   ],
  //   "Burger": [
  //     {
  //       "name": "Cheese Burger",
  //       "price": 8.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/cheese_burger.jpeg'
  //     },
  //     {
  //       "name": "Veggie Burger",
  //       "price": 7.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/burger/veggie_burger.jpg'
  //     },
  //     {
  //       "name": "Bacon Burger",
  //       "price": 9.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/bacon_burger.jpeg'
  //     },
  //     {
  //       "name": "Chicken Burger",
  //       "price": 8.49,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/chicken_burger.jpeg'
  //     },
  //     {
  //       "name": "Mushroom Swiss Burger",
  //       "price": 10.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/mushroom_swiss.jpeg'
  //     },
  //     {
  //       "name": "Double Cheese Burger",
  //       "price": 11.99,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/double_cheese.jpeg'
  //     },
  //     {
  //       "name": "Spicy Burger",
  //       "price": 9.49,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/spicy_burger.jpeg'
  //     },
  //     {
  //       "name": "Fish Burger",
  //       "price": 10.49,
  //       "veg": false,
  //       "image": 'assets/images/recipe/burger/fish_burger.jpeg'
  //     },
  //   ],
  //   "Juice": [
  //     {
  //       "name": "Orange Juice",
  //       "price": 3.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/orange_juice.jpeg'
  //     },
  //     {
  //       "name": "Apple Juice",
  //       "price": 4.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/apple_juice.jpeg'
  //     },
  //     {
  //       "name": "Grape Juice",
  //       "price": 4.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/grape_juice.jpeg'
  //     },
  //     {
  //       "name": "Mango Juice",
  //       "price": 5.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/mango_juice.jpeg'
  //     },
  //     {
  //       "name": "Carrot Juice",
  //       "price": 3.79,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/carrot_juice.jpeg'
  //     },
  //     {
  //       "name": "Pineapple Juice",
  //       "price": 4.29,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/pineapple_juice.jpeg'
  //     },
  //     {
  //       "name": "Cranberry Juice",
  //       "price": 4.79,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/cranberry_juice.jpeg'
  //     },
  //     {
  //       "name": "Watermelon Juice",
  //       "price": 4.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/juice/watermelon_juice.jpeg'
  //     },
  //   ],
  //   "Dessert": [
  //     {
  //       "name": "Chocolate Cake",
  //       "price": 4.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/chocolate_cake.jpeg'
  //     },
  //     {
  //       "name": "Ice Cream Sundae",
  //       "price": 5.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/ice_cream.jpeg'
  //     },
  //     {
  //       "name": "Cheesecake",
  //       "price": 6.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/cheesecake.jpeg'
  //     },
  //     {
  //       "name": "Brownie",
  //       "price": 3.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/brownie.jpeg'
  //     },
  //     {
  //       "name": "Cupcake",
  //       "price": 2.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/cupcake.jpeg'
  //     },
  //     {
  //       "name": "Tiramisu",
  //       "price": 5.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/tiramisu.jpeg'
  //     },
  //     {
  //       "name": "Fruit Tart",
  //       "price": 4.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/fruit_tart.jpeg'
  //     },
  //     {
  //       "name": "Macaron",
  //       "price": 3.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/dessert/macaron.jpeg'
  //     },
  //   ],
  //   "Wine": [
  //     {
  //       "name": "Chardonnay",
  //       "price": 12.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/chardonnay.jpeg'
  //     },
  //     {
  //       "name": "Merlot",
  //       "price": 14.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/merlot.jpeg'
  //     },
  //     {
  //       "name": "Cabernet Sauvignon",
  //       "price": 16.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/cabernet.jpeg'
  //     },
  //     {
  //       "name": "Pinot Noir",
  //       "price": 15.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/pinot_noir.jpeg'
  //     },
  //     {
  //       "name": "Sauvignon Blanc",
  //       "price": 13.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/sauvignon.jpeg'
  //     },
  //     {
  //       "name": "Rosé",
  //       "price": 11.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/rose.jpeg'
  //     },
  //     {
  //       "name": "Zinfandel",
  //       "price": 14.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/zinfandel.jpeg'
  //     },
  //     {
  //       "name": "Prosecco",
  //       "price": 10.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/wine/prosecco.jpeg'
  //     },
  //   ],
  //   "Coffee": [
  //     {
  //       "name": "Espresso",
  //       "price": 3.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/espresso.jpeg'
  //     },
  //     {
  //       "name": "Americano",
  //       "price": 4.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/americano.jpeg'
  //     },
  //     {
  //       "name": "Cappuccino",
  //       "price": 4.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/cappuccino.jpeg'
  //     },
  //     {
  //       "name": "Latte",
  //       "price": 5.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/latte.jpeg'
  //     },
  //     {
  //       "name": "Mocha",
  //       "price": 5.99,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/mocha.jpeg'
  //     },
  //     {
  //       "name": "Macchiato",
  //       "price": 4.79,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/macchiato.jpeg'
  //     },
  //     {
  //       "name": "Flat White",
  //       "price": 5.29,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/flat_white.jpeg'
  //     },
  //     {
  //       "name": "Affogato",
  //       "price": 6.49,
  //       "veg": true,
  //       "image": 'assets/images/recipe/coffee/affogato.jpeg'
  //     },
  //   ],
  // };

  void fetchCategory() async {
    final _dio = DioService();
    _dio.addToken(await SharedPreferencesHelper().getString("auth_token"));
    try {
      final res =
          await _dio.getData("http://82.180.147.87:8080/api/v1/:en/menu");
      if (res.statusCode == 200) {
        final data = res.data;
        debugPrint(data["data"][0].toString());
        if (data["success"] == true) {
          Map<String, List<Map<String, dynamic>>> temp = {
            "Pizza": [],
            "Wine": [],
          };
          for (int i = 0; i < data["data"].length; i++) {
            String status = data["data"][i]["category"]['name'];
            if (status == "Pizza") {
              temp['Pizza']?.add({
                "name": data["data"][i]["name"],
                "price": data["data"][i]["price"],
                "veg": !data["data"][i]["isNonVeg"],
                "image": data["data"][i]["category"]['photo'][0]
              });
            } else if (status == "Wine") {
              temp['Wine']?.add({
                "name": data["data"][i]["name"],
                "price": data["data"][i]["price"],
                "veg": !data["data"][i]["isNonVeg"],
                "image": data["data"][i]["category"]['photo'][0]
              });
            }
          }
          setState(() {
            categoryItems = temp;
          });
        }
      }
    } on DioException catch (e) {
      debugPrint("Dio Exception");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    final items = categoryItems[widget.selectedCategory] ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // Ensure vertical scrolling
      child: Align(
        alignment: Alignment.topLeft, // Align the grid to the left
        child: Wrap(
          spacing: 24, // Horizontal space between cards
          runSpacing: 24, // Vertical space between rows
          children: List.generate(
            items.length,
            (index) {
              final item = items[index];
              return GestureDetector(
                  child: FoodItemCard(item: item, onAvatarTap: () {}));
            },
          ),
        ),
      ),
    );
  }
}
