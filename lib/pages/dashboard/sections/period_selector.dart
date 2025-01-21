import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeriodSelector extends StatefulWidget {
  @override
  _PeriodSelectorState createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  // State variable to hold the selected period
  String _selectedPeriod = 'Today'; // Default value

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      items: [
        MenuFlyoutItem(
          text: const Text('Today'),
          onPressed: () {
            setState(() {
              _selectedPeriod = 'Today'; // Update the selected period
            });
          },
        ),
        MenuFlyoutItem(
          text: const Text('This Week'),
          onPressed: () {
            setState(() {
              _selectedPeriod = 'This Week'; // Update the selected period
            });
          },
        ),
        MenuFlyoutItem(
          text: const Text('This Month'),
          onPressed: () {
            setState(() {
              _selectedPeriod = 'This Month'; // Update the selected period
            });
          },
        ),
      ],
      leading: Text(
        _selectedPeriod, // Dynamically show the selected period
        style: TextStyle(
          fontSize: 16.sp, // Scaled font size based on screen size
          fontWeight: FontWeight.w600,
          color: _selectedPeriod == 'Today' ? Colors.blue : Colors.black, // Highlight the selected period
        ),
      ),
    );
  }
}
