import 'package:RMS/services/dio_service.dart';
import 'package:RMS/services/shared_preferences_helper.dart';
import 'package:RMS/view/menu/middle_screens/food_item_card.dart';
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
  //
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
  // };

  void fetchMenuItems() async {
    final _dio = DioService();
    _dio.addToken(await SharedPreferencesHelper().getString("auth_token"));
    try {
      final res =
          await _dio.getData("/menu");
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
    fetchMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    final items = categoryItems[widget.selectedCategory] ?? [];

    return Padding(padding: EdgeInsets.only(left: 8) ,
    child: SingleChildScrollView(
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
      )
    );
  }
}
