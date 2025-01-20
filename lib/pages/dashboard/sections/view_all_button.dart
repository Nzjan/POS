import 'package:fluent_ui/fluent_ui.dart';

class ViewAllButton extends StatefulWidget {
  @override
  _ViewAllButtonState createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<ViewAllButton> {
  // State variable to toggle the button text when pressed
  bool _isPressed = false;

  // Method to handle button press
  void _handlePress() {
    setState(() {
      // Toggle the state
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118, // Set the width of the button
      height: 33, // Set the height of the button
      child: Button(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding 12
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // Border radius 4
              side: const BorderSide(
                color: Color(0xFF74C9C1), // Border color #74C9C1
                width: 1, // Border width 1
              ),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            const Color(0xFFF3FAF9), // Background color #F3FAF9
          ),
        ),
        child: Text(
          _isPressed ? 'Pressed' : 'View All', // Change button text based on state
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700, // Bold text
            color: Color(0xff51B0AA), // Text color #51B0AA
          ), // Text style
        ),
        onPressed: _handlePress, // Call the method when button is pressed
      ),
    );
  }
}
