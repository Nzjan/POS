import 'package:fluent_ui/fluent_ui.dart';

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
      leading: Text(_selectedPeriod, style: const TextStyle(fontSize: 16)),
    );
  }
}
