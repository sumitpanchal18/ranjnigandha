import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

import '../utils/routes.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_button.dart'; // Import the button widget

class RedeemPointsScreen extends StatelessWidget {
  const RedeemPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Redeem Points",
      body: Column(
        children: [
          // Category Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 4, child: categoryButton("DS Group Product", true)),
                    const SizedBox(width: 10),
                    Expanded(flex: 6, child: categoryButton("E-Voucher / Gift Voucher", false)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(flex: 4, child: categoryButton("Utilities", false)),
                    const SizedBox(width: 10),
                    Expanded(flex: 6, child: categoryButton("Merchandise", false)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Filter & Sort
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  label: const Text("Filter"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text("Short By"),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Expanded GridView to be scrollable while keeping the rest fixed
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return productCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  // Category Button
  Widget categoryButton(String title, bool isSelected) {
    return CategoryItem(
      title: title,
      isSelected: isSelected,
      onTap: () => print("Category: $title"),
    );
  }

  // Product Card
  Widget productCard() {
    return InkWell(
      onTap: () {
        // Perform action when product card is clicked
        Get.toNamed(Routes.productDetail);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Balances content spacing
          children: [
            const SizedBox(height: 5),
            // 🔹 Product Image with Limited Height
            Flexible(
              child: Image.asset(
                AppImages.imgPulse,
                height: 80, // Ensure fixed height to prevent overflow
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 5),

            // 🔹 Product Name (Limited Lines to Avoid Overflow)
            Text(
              "Pulse Kaccha Aam Candy",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),

            // 🔹 Product Points
            const Text(
              "Points: 300",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🔹 Add to Cart Button with Fixed Height
            SizedBox(
              width: double.infinity,
              height: 35, // Consistent button height
              child: AppGradientButton(
                text: "Add to cart",
                onPressed: () {},
                textStyle: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),

            // 🔹 Redeem Button with Outlined Style
            SizedBox(
              width: double.infinity,
              height: 35, // Consistent button height
              child: AppGradientButton(
                text: "Redeem",
                onPressed: () {},
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                ),
                textStyle: TextStyle(color: Color(0xFFDA9828), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
