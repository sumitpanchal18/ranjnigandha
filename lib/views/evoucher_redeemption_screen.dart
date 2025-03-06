import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/widgets/custom_button.dart';
import '../widgets/redemption_card.dart';

class EVoucherRedemptionsScreen extends StatelessWidget {
  const EVoucherRedemptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "E-Voucher Redemptions",
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
              "E-Voucher Redemptions",
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
                itemBuilder: (context, index) => EVoucherCard(
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

// class EVoucherCard extends StatelessWidget {
//   const EVoucherCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: ColorConstant.bottomNavigationBarcolor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.orange, width: 1)),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text("Order# :", style: TextStyle(color: Colors.orange)),
//                       Text("5d83b0ff19fbb76283b0",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   Spacer(),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text("Placed On:", style: TextStyle(color: Colors.orange)),
//                       Text("30 Aug 2024",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   //use column
//                   Spacer(),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text("Status", style: TextStyle(color: Colors.orange)),
//                       Text("Pending",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Divider(color: Colors.white.withOpacity(0.4), thickness: 0.5),
//             const SizedBox(height: 10),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     AppImages.imgPulse,
//                     width: 120,
//                     height: 120,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       //use column for text
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text("Account Id :",
//                               style: TextStyle(color: Colors.white70)),
//                           Text("RWC0000005",
//                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text("Brand Name :",
//                               style: TextStyle(color: Colors.white70)),
//                           Text("Cafe Coffee Day Online",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       CategoryItem(
//                         title: "Resend",
//                         isSelected: false,
//                         unselectedBorderColor: Colors.orange,
//                         unselectedTextColor: Colors.orange,
//                         width: 80,
//                         height: 35,
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: ColorConstant.product_bg_clor,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   _InfoBox(title: "Denomination", value: "50"),
//                   _InfoBox(title: "Required Points", value: "313"),
//                   _InfoBox(title: "Quantity", value: "1"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _InfoBox extends StatelessWidget {
//   final String title, value;
//   const _InfoBox({required this.title, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Column(
//         children: [
//           Text(title, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
//           const SizedBox(height: 5),
//           Text(value,
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
