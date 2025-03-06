import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/images.dart';

import '../widgets/custom_button.dart';

class RedeemScreen extends StatefulWidget {
  @override
  _RedeemScreenState createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  int selectedAddressIndex = 0;

  final List<Map<String, String>> addresses = [
    {
      "name": "Srishti Sharma",
      "address": "Anantapur",
      "pincode": "515672 Andhra Pradesh",
      "details": "testing, testing2",
      "contact": "9548319796, srishti.sharma@ens.enterprises"
    },
    {
      "name": "Srishti Sharma",
      "address": "Anantapur",
      "pincode": "515672 Andhra Pradesh",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "Redeem",
      rightComponent: TextButton(
        onPressed: () {},
        child: const Text("+ Add Product",
            style: TextStyle(color: Colors.orange, fontSize: 16)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Item
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  Image.asset(
                    AppImages.imgPulse,
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pulse Kaccha Aam Candy",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Text("Point\n300"),
                            SizedBox(width: 40),
                            Text("Qty\n2"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Total Points
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total Points",
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                ),
                Text(
                  "234",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Spacer(),

          // Shipping Address
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Shipping Address",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.orange),
                  label:
                  const Text("Add", style: TextStyle(color: Colors.orange)),
                ),
              ],
            ),
          ),

          // Make only the address list scrollable
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio<int>(
                        value: index,
                        groupValue: selectedAddressIndex,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            selectedAddressIndex = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address["name"]!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(address["address"]!,
                                style: const TextStyle(color: Colors.white)),
                            Text(address["pincode"]!,
                                style: const TextStyle(color: Colors.white)),
                            if (address.containsKey("details"))
                              Text(address["details"]!,
                                  style:
                                  const TextStyle(color: Colors.white)),
                            if (address.containsKey("contact"))
                              Text(address["contact"]!,
                                  style:
                                  const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // Redeem Now Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppGradientButton(
              onPressed: () {
                showOtpDialog(context);
              },
              text: "Redeem Now",
              height: 45,
              textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

}

void showOtpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.imgClose,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),

              // Key Icon
              Image.asset(
                AppImages.imgKey,
                height: 50,
                width: 50,
                color: Colors.orange,
              ),

              const SizedBox(height: 10),

              // Title
              const Text(
                "Enter OTP",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // OTP Fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    activeColor: Colors.black,
                    selectedColor: Colors.orange,
                    inactiveColor: Colors.grey,
                  ),
                  onChanged: (value) {},
                ),
              ),

              const SizedBox(height: 10),

              // Submit Button
              AppGradientButton(
                onPressed: () {
                  // Handle Submit OTP
                },
                text: "Submit",
                height: 45,
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Resend OTP
              TextButton(
                onPressed: () {
                  // Handle Resend OTP
                },
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(color: Colors.orange, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
