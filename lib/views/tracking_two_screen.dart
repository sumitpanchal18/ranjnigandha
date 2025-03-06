import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/images.dart';

import '../widgets/vertical_step_indicator.dart';

class TrackingTwoScreen extends StatelessWidget {
  const TrackingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "Tracking",
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderConfirmedCard(),
            const SizedBox(height: 16),
            _buildShipmentTracking(),
          ],
        ),
      ),
    );
  }

  /// **1️⃣ Order Confirmation Card**
  Widget _buildOrderConfirmedCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.imgSuccess, height: 40, color: Colors.green,),
              const SizedBox(width: 20),
              Column(
                children: [
                  const Text("Order #1001", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const Text("Thank You!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ],
          ),
          const Divider(height: 20,),
          const Text(
            "Your order is confirmed",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 8),
          const Text(
            "We've accepted your order and we're getting it ready. Come back to the page for update on your shipment status.",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          const Text(
            "Tracking Numbers",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          _buildTrackingNumber("98732443543"),
        ],
      ),
    );
  }

  /// **2️⃣ Shipment Tracking Progress**
  Widget _buildShipmentTracking() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Shipment Delivered", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildProgressBar(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              const Text(
                "Tracking Numbers ",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              _buildTrackingNumber("98732443543"),
            ],
          ),
          const SizedBox(height: 30),
          _buildOrderTimeline(),
        ],
      ),
    );
  }

  /// **3️⃣ Order Timeline View**
  Widget _buildOrderTimeline() {
    List<Map<String, String>> timelineEvents = [
      {"title": "Shipment delivered", "subtitle": "Sector 63 noida", "date": "30 Sep 2024", "time": "Fri 3:42 pm"},
      {"title": "Shipment Out for delivery", "subtitle": "Sector 63 noida", "date": "30 Sep 2024", "time": "Fri 3:42 pm"},
      {"title": "Undelivered shipment hold at location", "subtitle": "Sector 63 noida", "date": "30 Sep 2024", "time": "Fri 3:42 pm"},
      {"title": "Ordered", "subtitle": "Your Order has been placed.", "date": "30 Sep 2024", "time": "Fri 3:42 pm"},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: VerticalStepIndicator(steps: timelineEvents),
    );
  }


  /// **🔹 Tracking Number with Clickable Link**
  Widget _buildTrackingNumber(String trackingNumber) {
    return GestureDetector(
      onTap: () {}, // TODO: Add tracking URL action
      child: Text(
        trackingNumber,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  /// **🔹 Order Progress Bar**
  Widget _buildProgressBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          bottom: 35,
          left: 40,
          right: 20,
          child: CustomPaint(painter: _ProgressLinePainter()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _TrackingStep(completed: true, label: "Shipment Booked", date: "28 July"),
            _TrackingStep(completed: true, label: "In transport", date: "2 Aug"),
            _TrackingStep(completed: true, label: "Out for delivery", date: "3 Aug"),
            _TrackingStep(completed: true, label: "Delivered", date: "3 Aug"),
          ],
        ),
      ],
    );
  }

  /// **🔹 Timeline Item**
  Widget _buildTimelineItem(Map<String, String> event, bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 20),
            if (!isFirst) Container(height: 30, width: 2, color: Colors.green),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event["status"]!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(event["location"]!, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              Text("${event["date"]!} • ${event["time"]!}", style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

/// **📌 Tracking Step Component**
class _TrackingStep extends StatelessWidget {
  final bool completed;
  final String label;
  final String date;

  const _TrackingStep({required this.completed, required this.label, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: completed ? Colors.green : Colors.grey.shade300,
          child: completed ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: completed ? Colors.black : Colors.grey)),
        Text(date, style: TextStyle(fontSize: 10, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

/// **📌 Custom Progress Line Painter**
class _ProgressLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()..color = Colors.grey.shade300..strokeWidth = 4..strokeCap = StrokeCap.round;
    final Paint progressPaint = Paint()..color = Colors.green..strokeWidth = 4..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), backgroundPaint);
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
