import 'package:fluent_ui/fluent_ui.dart';

class RegisterStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white, // Background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Register Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff333333),
            ),
          ),
          const SizedBox(height: 9),
          // Status list
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusRow('Opening float', '\$ 12,000'),
                _buildStatusRow('Cash Sales', '\$ 20,000'),
                _buildStatusRow('Cash Refunds', '-'),
                _buildStatusRow('Cash Out', '-'),
                _buildStatusRow('Cash In', '-'),
                _buildStatusRow('Other Sales', '-'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff585858),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff585858),
            ),
          ),
        ],
      ),
    );
  }
}
