import 'package:fluent_ui/fluent_ui.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart'; // Added for DateFormat

class HeaderBar extends StatelessWidget {
  final String title;
  final VoidCallback onMenuTap;
  final int selectedPageIndex;
  final int? selectedSubPageIndex;

  const HeaderBar({
    super.key,
    required this.title,
    required this.onMenuTap,
    required this.selectedPageIndex,
    this.selectedSubPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 70),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onMenuTap,
                child: Container(
                  height: 37,
                  width: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white, // Simplified color
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(width: 0.6, color: const Color(0xffadadad)),
                  ),
                  child: const Icon(Iconsax.menu_1, color: Color(0xff3e3e3e)),
                ),
              ),
              const SizedBox(width: 18),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _formatDate(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _formatTime(DateTime.now()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Lato',
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  // Formats date to 'MMM d' format
  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  // Formats time to 'hh:mm a' (12-hour format with AM/PM)
  String _formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(dateTime);
  }
}
