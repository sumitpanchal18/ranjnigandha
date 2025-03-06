import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/widgets/custom_button.dart';
import '../widgets/redemption_card.dart';
import '../widgets/redemption_card_two.dart';

class RedemptionHistoryScreen extends StatelessWidget {
  const RedemptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "Redemption History",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildDateField("Start Date:")),
                const SizedBox(width: 10),
                Expanded(child: _buildDateField("End Date:")),
              ],
            ),
            const SizedBox(height: 15),
            AppGradientButton(
              text: "View",
              height: 45,
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            const Text(
              "Redemption History",
              style: TextStyle(
                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Wrap ListView in Expanded to avoid extra space issue
            Expanded(
              child: ListView.builder(
                shrinkWrap: true, // Ensures ListView takes only required space
                physics: const BouncingScrollPhysics(),
                itemCount: 2, // Two cards for demo
                itemBuilder: (context, index) => EVoucherCardTwo(
                  orderId: "5d83b0ff19fbb76283b0",
                  placedOn: "30 Aug 2024",
                  status: "Pending",
                  denomination: "50",
                  quantity: "1",
                  isDetailed: true,
                  transactionId: "5d83b0ff19fbb76283b0",
                  brandProductCode: "RWC0000005",
                  createdAt: "30 Aug 2024",
                  updatedAt: "30 Aug 2024",
                  transactionType: "-Dr",
                  onResend: () {
                    // Handle resend action
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(String label) {

    //provide label and text field for date using column
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 5),
        SizedBox(
          height: 45,
          child: TextField(
              decoration: InputDecoration(
                hintText: "mm/dd/yyyy",
                hintStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              style: const TextStyle(color: Colors.white)
          ),
        ),
      ],
    );
  }
}
