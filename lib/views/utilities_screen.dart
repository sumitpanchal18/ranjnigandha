import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';

import '../widgets/category_item.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Utilities",
      rightButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () {
          },
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
              crossAxisCount: 2, // number of columns
              mainAxisSpacing: 10, // spacing vertically
              crossAxisSpacing: 10, // spacing horizontally
              childAspectRatio: 4.1, // Adjust this to set item height
              children: [
                CategoryItem(title: "DS group products", isSelected: false, onTap: () {}),
                CategoryItem(title: "E-Voucher / Gift Voucher", isSelected: false, onTap: () {}),
                CategoryItem(title: "Utilities", isSelected: true, onTap: () {}),
                CategoryItem(title: "Merchandise", isSelected: false, onTap: () {}),
              ],
            ),

            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CupertinoSearchTextField(
                    placeholder: "Search in orders",
                    placeholderStyle: const TextStyle(color: Colors.white,fontSize: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 4.0),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                    label: const Text("Filter"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    utilitiesSection("Recharge", [
                      utilityIcon("Mobile Recharge", Icons.phone_android),
                      utilityIcon("DTH", Icons.tv),
                      utilityIcon("Fastag", Icons.directions_car),
                      utilityIcon("Landline", Icons.phone),
                    ]),
                    const SizedBox(height: 20),
                    utilitiesSection("Utilities", [
                      utilityIcon("Electricity", Icons.flash_on),
                      utilityIcon("Water", Icons.water_drop),
                      utilityIcon("Piped Gas", Icons.local_gas_station),
                      utilityIcon("School Fees", Icons.school),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(String title, bool isSelected) {
    return CategoryItem(
      title: title,
      isSelected: isSelected,
      onTap: () {},
    );
  }

  Widget utilitiesSection(String title, List<Widget> icons) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.bottomNavigationBarcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // take minimal vertical space
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade700,
          ),
          const SizedBox(height: 10),
          GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75, // Adjusts child height to fit content
            children: icons,
          ),
        ],
      ),
    );
  }


  Widget utilityIcon(String label, IconData iconData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Icon(iconData, color: Colors.black, size: 20),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

}
