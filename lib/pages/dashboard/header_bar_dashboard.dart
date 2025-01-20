import 'package:fluent_ui/fluent_ui.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';


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
      margin: const EdgeInsets.only(left: 72),
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
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(21),
                    border: Border.all(width: 0.6, color: const Color(0xffadadad)),

                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FluentIcons.search_art64,
                        color: Color(0xff3e3e3e),
                        size: 18,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextBox(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.3),
                          placeholder: 'Let\'s cook food',
                          placeholderStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff3e3e3e),
                            fontWeight: FontWeight.bold,
                          ),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.transparent),
                          ),
                          foregroundDecoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _formatTime(DateTime.now()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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
  String _formatDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm a'); // 12-hour format with AM/PM
    return formatter.format(dateTime);
  }
}