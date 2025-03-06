import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';
import 'category_item.dart';

class EVoucherCard extends StatelessWidget {
  final String orderId;
  final String placedOn;
  final String status;
  final String accountId;
  final String brandName;
  final String denomination;
  final String requiredPoints;
  final String quantity;
  final VoidCallback onResend;

  const EVoucherCard({
    super.key,
    required this.orderId,
    required this.placedOn,
    required this.status,
    required this.accountId,
    required this.brandName,
    required this.denomination,
    required this.requiredPoints,
    required this.quantity,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstant.bottomNavigationBarcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.orange, width: 1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Order# :", style: TextStyle(color: Colors.orange)),
                      Text(orderId,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Placed On:", style: TextStyle(color: Colors.orange)),
                      Text(placedOn,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Status", style: TextStyle(color: Colors.orange)),
                      Text(status,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.white.withOpacity(0.4), thickness: 0.5),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages.imgPulse,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Account Id :",
                              style: TextStyle(color: Colors.white70)),
                          Text(accountId,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Brand Name :",
                              style: TextStyle(color: Colors.white70)),
                          Text(brandName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CategoryItem(
                        title: "Resend",
                        isSelected: false,
                        unselectedBorderColor: Colors.orange,
                        unselectedTextColor: Colors.orange,
                        width: 80,
                        height: 35,
                        onTap: onResend,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorConstant.product_bg_clor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoBox(title: "Denomination", value: denomination),
                  _InfoBox(title: "Required Points", value: requiredPoints),
                  _InfoBox(title: "Quantity", value: quantity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String title, value;
  const _InfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
