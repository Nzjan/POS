import 'package:flutter/material.dart';
class ReservationDetails extends StatelessWidget {
  final Map<String, dynamic> reserve;

  const ReservationDetails({required this.reserve});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${reserve['reserve_no']}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Customer: ${reserve['customer']}'),
          Text('Phone: ${reserve['phone_no']}'),
          Text('Date: ${reserve['date']}'),
          Text('Time: ${reserve['time']}'),
          Text('Day: ${reserve['day']}'),
        ],
      ),
    );
  }
}
