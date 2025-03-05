import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/routes.dart';

import '../utils/images.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpScreen(),
  ));
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Track the state of the checkboxes
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: SvgPicture.asset(
              AppImages.appBackground,
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Text
                const Text(
                  "Sign Up to Rajnigandha Business Club",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Form Fields
                _buildDoubleInputField("First Name", "Last Name"),
                _buildDoubleInputField("Email Address", ""),
                _buildDoubleInputField("Pincode", "City"),
                _buildDoubleInputField("Coupon Code", "Scan & Earn"),
                _buildDoubleInputField("State", "Serial no."),
                _buildCouponField(),
                _buildSingleInputField("Mobile Number", hasOtp: true),
                _buildSingleInputField("Enter OTP", hasVerifyButton: true),

                const SizedBox(height: 20),

                // Checkboxes
                _buildCheckBoxWithState(
                  "I am above 18 years of age and I agree to the Program ",
                  "Terms & Conditions",
                  isChecked1,
                      (bool? value) {
                    setState(() {
                      isChecked1 = value ?? false;
                    });
                  },
                ),
                _buildCheckBoxWithState(
                  "By creating an account I agree to ",
                  "Privacy Policy & Terms of Use",
                  isChecked2,
                      (bool? value) {
                    setState(() {
                      isChecked2 = value ?? false;
                    });
                  },
                ),
                _buildCheckBoxWithState(
                  "I agree to receive promotional email/SMS/Notification. App Notification or Whatsapp messages from Dharampal Satyapal Limited.",
                  "",
                  isChecked3,
                      (bool? value) {
                    setState(() {
                      isChecked3 = value ?? false;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Sign Up Button
                _buildSignUpButton(),

                const SizedBox(height: 10),

                // Log In Text
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account yet? ",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: const TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// **Builds Two TextFields in a Row**
  Widget _buildDoubleInputField(String hint1, String hint2) {
    return Row(
      children: [
        Expanded(child: _buildInputField(hint1)),
        const SizedBox(width: 10),
        if (hint2.isNotEmpty) Expanded(child: _buildInputField(hint2)),
      ],
    );
  }

  /// **Builds a Single Full-Width TextField**
  Widget _buildSingleInputField(String hint,
      {bool hasOtp = false, bool hasVerifyButton = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: _inputDecoration(),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (hasOtp)
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Send OTP",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.yellow),
                ),
              ),
            if (hasVerifyButton)
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// **Builds a Coupon Code Field and Scan Section Separately**
  /// **Builds a Coupon Code Field and Scan Section Separately**
  Widget _buildCouponField() {
    return Row(
      children: [
        Expanded(child: _buildInputField("Coupon Code")),

        const SizedBox(width: 10),

        // Scan & Earn Section with fixed width for QR code
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: _inputDecoration(),
          child: Row(
            children: [
              const Text(
                "Scan & earn",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // Add QR scan functionality here
                },
                child: Image.asset(
                  AppImages.qrCode, // QR code asset
                  width: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  /// **Reusable Input Field**
  Widget _buildInputField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: _inputDecoration(),
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  /// **Checkbox with state management**
  Widget _buildCheckBoxWithState(String text, String highlight, bool isChecked, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: Colors.red,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              children: [
                if (highlight.isNotEmpty)
                  TextSpan(
                    text: highlight,
                    style: const TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// **Sign Up Button**
  Widget _buildSignUpButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Sign Up to Rajnigandha Business Club",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  /// **Box Decoration for TextFields**
  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
