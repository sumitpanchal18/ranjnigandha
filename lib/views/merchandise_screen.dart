import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';
import 'package:rajanigandha/widgets/custom_button.dart';

import '../widgets/category_item.dart';

class MerchandiseScreen extends StatelessWidget {
  const MerchandiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Merchandise",
      rightButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart, color: ColorConstant.gd2),
              Text(
                "(3)",
                style: TextStyle(color: ColorConstant.gd2, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4.1,
              children: [
                CategoryItem(
                    title: "DS group products",
                    isSelected: false,
                    onTap: () {}),
                CategoryItem(
                    title: "E-Voucher / Gift Voucher",
                    isSelected: false,
                    onTap: () {}),
                CategoryItem(
                    title: "Utilities", isSelected: true, onTap: () {}),
                CategoryItem(
                    title: "Merchandise", isSelected: false, onTap: () {}),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              child: comingSoonWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget comingSoonWidget() {
    return Column(children: [
      Image.asset(
        AppImages.comingSoon,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      SizedBox(
        height: 20,
      ),
      AppGradientButton(
        width: 100,
        height: 40,
        textStyle: const TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        text: "Go To Home",
        onPressed: () {},
      )
    ]);
  }
}
