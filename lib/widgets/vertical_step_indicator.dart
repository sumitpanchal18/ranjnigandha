import 'package:flutter/material.dart';

class VerticalStepIndicator extends StatelessWidget {
  final List<Map<String, String>> steps;

  const VerticalStepIndicator({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        bool isLast = index == steps.length - 1;
        return _buildStepItem(
          title: steps[index]["title"]!,
          subtitle: steps[index]["subtitle"]!,
          date: steps[index]["date"]!,
          time: steps[index]["time"]!,
          isCompleted: true, // Adjust this dynamically as needed
          isLast: isLast,
        );
      }),
    );
  }

  /// **🔹 Step Item with Connector Line**
  Widget _buildStepItem({
    required String title,
    required String subtitle,
    required String date,
    required String time,
    required bool isCompleted,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            /// **Step Circle**
            CircleAvatar(
              radius: 12,
              backgroundColor: isCompleted ? Colors.green : Colors.grey.shade400,
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),

            /// **Connecting Line (except last step)**
            if (!isLast)
              Container(
                height: 30,
                width: 2,
                color: Colors.green,
              ),
          ],
        ),
        const SizedBox(width: 20),

        /// **Step Details**
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              Text("$date • $time",
                  style: const TextStyle(fontSize: 12, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
