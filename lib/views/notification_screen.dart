import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/widgets/custom_button.dart';

import '../utils/color_constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController couponCodeController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController accountBalanceController = TextEditingController();

  bool isSerialNumberChecked = false;
  bool isCouponCodeChecked = false;
  bool isEmailIdChecked = false;
  bool isAccountBalanceChecked = false;

  void _onSubmit() {
    if (isSerialNumberChecked && serialNumberController.text.isEmpty) {
      _showSnackBar("Please enter Serial Number");
      return;
    }

    if (isCouponCodeChecked && couponCodeController.text.isEmpty) {
      _showSnackBar("Please enter Coupon Code");
      return;
    }

    if (isEmailIdChecked && emailIdController.text.isEmpty) {
      _showSnackBar("Please enter Email Id");
      return;
    }

    if (isAccountBalanceChecked && accountBalanceController.text.isEmpty) {
      _showSnackBar("Please enter Account Balance");
      return;
    }

    _showSnackBar("Submitted successfully!");
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Notification",
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: Get.height * 0.4),
          child: Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCheckboxField(
                  "Email Id",
                  emailIdController,
                  "DSG-lse43pok",
                  isEmailIdChecked,
                      (value) => setState(() => isEmailIdChecked = value),
                ),
                const SizedBox(height: 15),
                _buildCheckboxField(
                  "Account Balance",
                  accountBalanceController,
                  "1000",
                  isAccountBalanceChecked,
                      (value) => setState(() => isAccountBalanceChecked = value),
                ),
                const SizedBox(height: 15),
                _buildCheckboxField(
                  "Enter Sr. Number",
                  serialNumberController,
                  "Enter Sr. number",
                  isSerialNumberChecked,
                      (value) => setState(() => isSerialNumberChecked = value),
                ),
                const SizedBox(height: 15),
                _buildCheckboxField(
                  "Enter Coupon code",
                  couponCodeController,
                  "Enter Coupon code (Max up to 15)",
                  isCouponCodeChecked,
                      (value) => setState(() => isCouponCodeChecked = value),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("Submit", _onSubmit),
                    _buildButton("Scan & Earn", () {
                      _showSnackBar("Scanning feature coming soon!");
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// **Helper Widget: Label**
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  /// **Helper Widget: Checkbox + Input Field**
  Widget _buildCheckboxField(
      String label, TextEditingController controller, String hintText, bool isChecked, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 0,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) => onChanged(value ?? false),
            activeColor: Colors.orange,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Removes extra padding

          ),
        ),
        const SizedBox(width: 8), // Adds spacing between checkbox and input field
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(label),
              const SizedBox(height: 5),
              TextField(
                controller: controller,
                enabled: isChecked,
                decoration: InputDecoration(
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// **Helper Widget: Gradient Button**
  Widget _buildButton(String text, VoidCallback onTap) {
    return AppGradientButton(
      text: text,
      onPressed: onTap,
      width: 150,
      height: 40,
      borderRadius: 20,
      textStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
