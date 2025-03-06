import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';
import 'category_item.dart';

class EVoucherCardTwo extends StatelessWidget {
  final String orderId;
  final String placedOn;
  final String status;
  final String denomination;
  final String quantity;
  final bool isDetailed; // New flag to switch between views
  final String? transactionId;
  final String? brandProductCode;
  final String? createdAt;
  final String? updatedAt;
  final String? transactionType;
  final VoidCallback? onResend;

  const EVoucherCardTwo({
    super.key,
    required this.orderId,
    required this.placedOn,
    required this.status,
    required this.denomination,
    required this.quantity,
    this.isDetailed = false, // Default to false (original view)
    this.transactionId,
    this.brandProductCode,
    this.createdAt,
    this.updatedAt,
    this.transactionType,
    this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstant.bottomNavigationBarcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.orange.shade600, width: 1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Order ID & Status Row**
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

            /// **Image & Details**
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages.imgProductIcon,
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isDetailed) ...[
                        /// **Transaction ID**
                        const Text("Transaction Id :", style: TextStyle(color: Colors.white70)),
                        Text(transactionId ?? "N/A",
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),

                        /// **Brand Product Code**
                        const Text("BrandProduct Code :", style: TextStyle(color: Colors.white70)),
                        Text(brandProductCode ?? "N/A",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),

                        /// **Created At & Updated At**
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Created At :", style: TextStyle(color: Colors.white70)),
                                Text(createdAt ?? "N/A",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Updated At :", style: TextStyle(color: Colors.white70)),
                                Text(updatedAt ?? "N/A",
                                    style: const TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ] else ...[
                        /// **Default Fields (Non-Detailed View)**
                        const Text("Brand Name :", style: TextStyle(color: Colors.white70)),
                        Text(brandProductCode ?? "N/A",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                      const SizedBox(height: 10),

                      /// **Resend Button (Only if not detailed)**
                      if (!isDetailed)
                        CategoryItem(
                          title: "Resend",
                          isSelected: false,
                          unselectedBorderColor: Colors.orange,
                          unselectedTextColor: Colors.orange,
                          width: 80,
                          height: 35,
                          onTap: onResend ?? () {},
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            /// **Denomination, Transaction Type (if detailed), Quantity**
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
                  if (isDetailed)
                    _InfoBox(title: "Transaction Type", value: transactionType ?? "-"),
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
              style: TextStyle(
                  color: value.contains("-Dr") ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}