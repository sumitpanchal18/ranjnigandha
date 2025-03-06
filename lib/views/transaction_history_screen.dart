import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/routes.dart';
import 'package:rajanigandha/widgets/custom_button.dart';

import '../widgets/category_item.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = List.generate(12, (index) {
    return {
      "srNo": "${index + 1}",
      "orderId": "65874254anchewj\nyyeiweighfg",
      "status": index % 3 == 0
          ? "Hold"
          : index % 3 == 1
          ? "Refund"
          : "Earn",
      "point": index % 3 == 0 ? "2000" : index % 3 == 1 ? "300" : "843",
    };
  });

  TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Transaction History",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Date Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateButton("Start Date"),
                dateButton("End Date"),
                //create a view button using elevated button
                CategoryItem(
                  title: "View",
                  height: 40,
                  onTap: () {
                    Get.toNamed(Routes.transactionDetail);
                  }, isSelected: true,
                ),
                
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Table Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: ColorConstant.bottomNavigationBarcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text("Sr no.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      flex: 3,
                      child: Text("Order Id",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      flex: 2,
                      child: Text("Status",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      flex: 2,
                      child: Text("Point",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ),

          // Transaction List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return InkWell(
                    onTap: () {
                      // Open transaction detail screen
                      Get.toNamed(Routes.transactionDetail);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: index % 2 == 0
                          ? ColorConstant.appColor
                          : ColorConstant.white.withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(transaction["srNo"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white))),
                          Expanded(
                              flex: 3,
                              child: Text(transaction["orderId"]!,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white))),
                          Expanded(
                              flex: 2,
                              child: Text(transaction["status"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white))),
                          Expanded(
                              flex: 2,
                              child: Text(transaction["point"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white))),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.orange, size: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  // Date Picker Button
  Widget dateButton(String text) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.calendar_today, color: Colors.white, size: 18),
      label: Text(text,
          style: const TextStyle(color: Colors.white, fontSize: 14)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
    );
  }
}
