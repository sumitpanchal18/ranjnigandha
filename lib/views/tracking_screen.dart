import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/images.dart';

class TrackingScreen extends StatelessWidget {
  final List<String> steps = [
    "Ordered",
    "Shipped",
    "Out for delivery",
    "Delivered"
  ];
  final int currentStep = 1; // Change this to simulate different progress states

  TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "Track Order",
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductDetails(),
              const SizedBox(height: 16),
              _buildTrackingCard(),
              const SizedBox(height: 16),
              _buildInfoCard("Shipped with Rajnigandha",
                  "Tracking ID: 656687954", "See all updates"),
              const SizedBox(height: 12),
              _buildInfoCard(
                  "Shipping Address",
                  "Shikhar Shrivastav\nNoida, Sector 62, B-65 Uttar Pradesh\nPin-110096",
                  null),
              const SizedBox(height: 12),
              _buildInfoCard("Points", "Total 263.00", "See all Information"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              AppImages.imgPulse,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Pulse Kachcha Aam Candy",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 4),
            Text("Net Weight : 190", style: TextStyle(color: Colors.white)),
            SizedBox(height: 2),
            Text("Points: 300", style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _buildTrackingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Arriving Friday",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "Shipped\nPackage arrived at Rajnigandha",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          _buildTrackingProgress(),
          const SizedBox(height: 20),
          //below component should be a row with 3 buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    _buildActionButton("Share Tracking"),
                    SizedBox(width: 10),
                    _buildActionButton("Request\ncancellation"),
                SizedBox(width: 10),
                    _buildActionButton("Buy again"),

              ],
            ),
          ),

          // Wrap(
          //   spacing: 6, // Spacing between buttons
          //   runSpacing: 6, // Spacing between button rows
          //   alignment: WrapAlignment.center,
          //   children: [
          //     _buildActionButton("Share Tracking"),
          //     _buildActionButton("Request cancellation"),
          //     _buildActionButton("Buy again"),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildTrackingProgress() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 14,
          left: 10,
          right: 0,
          child: CustomPaint(
            painter: _ProgressLinePainter(currentStep),
          ),
        ),
        Row(
          children: [
            _buildTrackingStep(true, "Ordered"),
            Spacer(),
            _buildTrackingStep(true, "Shipped"),
            Spacer(),
            _buildTrackingStep(false, "Out for delivery"),
            Spacer(),
            _buildTrackingStep(false, "Delivered"),
          ],
        ),
      ],
    );
  }

  Widget _buildTrackingStep(bool completed, String label) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: completed ? Colors.green : Colors.grey.shade300,
            ),
            if (completed)
              const Icon(Icons.check, size: 16, color: Colors.white),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
              fontSize: 12, color: completed ? Colors.black : Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text) {
    return SizedBox(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.orange),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          backgroundColor: Colors.orange.withOpacity(0.1),
        ),
        child: Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.orange, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, String? actionText) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          if (actionText != null) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Text(
                actionText,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProgressLinePainter extends CustomPainter {
  final int currentStep;

  _ProgressLinePainter(this.currentStep);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300 // Background line for all steps
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = Colors.green // Progress line for completed steps
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final int totalSteps = 4; // Total number of steps
    final double stepWidth = size.width / (totalSteps - 1); // Correct division

    // Draw the background line (width of the last step)
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width - 20, size.height / 2), backgroundPaint);

    // Draw the progress line (only up to the current step)
    double progressWidth = stepWidth * currentStep;
    canvas.drawLine(Offset(0, size.height / 2), Offset(progressWidth - 10, size.height / 2), progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

