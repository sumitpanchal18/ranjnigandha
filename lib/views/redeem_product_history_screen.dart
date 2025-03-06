import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/widgets/custom_button.dart';
import 'package:rajanigandha/widgets/redemption_card_two.dart';
import '../widgets/redemption_card.dart';

class RedeemProductHistroyScreen extends StatelessWidget {
  const RedeemProductHistroyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "Redeem product history",
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
              "Product History",
              style: TextStyle(
                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                EVoucherCard(
                  orderId: "5d83b0ff19fbb76283b0",
                  placedOn: "30 Aug 2024",
                  status: "Pending",
                  accountId: "RWC0000005",
                  brandName: "Cafe Coffee Day Online",
                  denomination: "50",
                  requiredPoints: "313",
                  quantity: "1",
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