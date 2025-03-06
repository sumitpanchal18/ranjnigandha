import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

class TransactionDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Transaction Detail",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image & User Info
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Image.asset(AppImages.imgPulse, fit: BoxFit.cover),
                ),
                const SizedBox(width: 10,height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Srishti Sharma",
                      style: TextStyle(
                        color: ColorConstant.gd2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Ds Product Redeem has been \nprocessed successfully.",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Date, Order No, Delivered To
            _buildInfoRow("Date:", "7/24/2024, 5:38:45 PM"),
            _buildInfoRow("Order No:", "a0eec36d4005a2091fb4"),
            _buildInfoRow("Delivered To:", "Srishti Sharma\n9548319796\nsrishti.sharma@ens.enterprises"),

            const SizedBox(height: 20),

            // Transaction Details Box
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTransactionRow("Transaction Id", "cb12c18fe7e865f902c5"),
                  _buildTransactionRow("Status", "Hold"),
                  _buildTransactionRow("Transaction Type", "-Dr", textColor: Colors.green),
                  _buildTransactionRow("Transaction Category", "Ds Product Redeem"),
                  _buildTransactionRow("Points", "300"),
                  _buildTransactionRow("Placed At", "7/24/2024, 5:38:45 PM"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the top
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14, // Adjust size as per the image
            ),
          ),
          const SizedBox(width: 15), // Adjust space between label and value
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14, // Adjust size as per the image
              ),
              textAlign: TextAlign.start, // Ensure text aligns to start
              softWrap: true, // Allow text to wrap properly
            ),
          ),
        ],
      ),
    );
  }



  // Common row for transaction details
  Widget _buildTransactionRow(String title, String value, {Color textColor = Colors.white}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
              ),
              Text(
                value,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 3),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white24,
        ),
        SizedBox(height: 3),
      ],

    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0A1A44),
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.redeem), label: "Redeem"),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: "Scan & Earn"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
