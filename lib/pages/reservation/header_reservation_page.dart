import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HeaderReservationPage extends StatelessWidget {
  const HeaderReservationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 72),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: 37,
              width: 689,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(width: 0.6, color: const Color(0xffadadad)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff5c5c5c).withOpacity(0.5),
                    blurRadius: 12.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: const Icon(Iconsax.menu_1, color: Color(0xff3e3e3e)),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(21),
                border: Border.all(width: 0.6, color: const Color(0xffadadad)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff5c5c5c).withOpacity(0.5),
                    blurRadius: 12.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xff3e3e3e),
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Let\'s cook food',
                        hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff3e3e3e),
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.3),
                      ),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
