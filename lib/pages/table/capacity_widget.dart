import 'package:flutter/material.dart';

class CapacityWidget extends StatefulWidget {
  @override
  _CapacityWidgetState createState() => _CapacityWidgetState();
}

class _CapacityWidgetState extends State<CapacityWidget> {
  int _capacity = 0;

  void _increaseCapacity() {
    setState(() {
      _capacity++;
    });
  }

  void _decreaseCapacity() {
    setState(() {
      if (_capacity > 0) {
        _capacity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Capacity",
          style: TextStyle(
            fontSize: 12,
            fontFamily:"Lato",
            color: Color(0xffacacac),
              fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline_sharp),
              onPressed: _decreaseCapacity,
              iconSize:45,
              color: Color(0xff292929),
            ),
            Text(
              '$_capacity',
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily:"Lato",
                  fontWeight: FontWeight.w600,
                color: Color(0xffe8e8e8),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline_rounded),
              onPressed: _increaseCapacity,
              iconSize:45,
            ),
          ],
        ),
      ],
    );
  }
}
