import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/color_constant.dart';
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

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Sign Up to Rajnigandha Business Club",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Scrollable Form
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name Input Row
                        _buildInputRow([
                          _buildInputField("First Name", flex: 1),
                          SizedBox(width: 10),
                          _buildInputField("Last Name", flex: 1),
                        ]),

                        // Email Input
                        _buildInputRow([
                          _buildInputField("Email Address", flex: 2),
                        ]),

                        // Pincode and City Input
                        _buildInputRow([
                          _buildInputField("Pincode", flex: 1),
                          SizedBox(width: 10),
                          _buildInputField("City", flex: 1),
                        ]),

                        // Coupon Code and Scan & Earn
                        _buildInputRow([
                          _buildInputField("Coupon Code", flex: 1),
                          SizedBox(width: 10),
                          _buildScanEarnField(),
                        ]),
                        // State and Serial Number
                        _buildInputRow([
                          _buildInputField("State", flex: 1),
                          SizedBox(width: 10),
                          _buildInputField("Serial no.", flex: 1),
                        ]),

                        // Mobile Number with OTP
                        _buildInputRow([
                          _buildInputField(
                              "Mobile Number",
                              flex: 2,
                              suffix: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                    color: ColorConstant.gd2,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                          ),
                        ]),

                        // OTP Verification
                        _buildInputRow([
                          _buildInputField(
                              "Enter OTP",
                              flex: 2,
                              suffix: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Verify",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                          ),
                        ]),

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

                        SizedBox(height: 20),

                        // Sign Up Button
                        _buildSignUpButton(),

                        SizedBox(height: 10),

                        // Login Link
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Have an account yet? ",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                              children: [
                                TextSpan(
                                  text: "Log In",
                                  style: TextStyle(
                                    color: ColorConstant.gd2,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build input rows with consistent layout
  Widget _buildInputRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: children,
      ),
    );
  }

  // Flexible input field with optional suffix
  Widget _buildInputField(String hint, {int flex = 1, Widget? suffix}) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: _inputDecoration(),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (suffix != null) suffix,
          ],
        ),
      ),
    );
  }

  // Scan & Earn field with QR code
  Widget _buildScanEarnField() {
    return Expanded(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: _inputDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Scan & Earn",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {

              },
              child: Image.asset(
                AppImages.qrCode,
                width: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Checkbox with state and highlight text
  Widget _buildCheckBoxWithState(
      String text,
      String highlight,
      bool isChecked,
      ValueChanged<bool?> onChanged
      ) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: ColorConstant.gd2,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(color: Colors.white, fontSize: 12),
              children: [
                if (highlight.isNotEmpty)
                  TextSpan(
                    text: highlight,
                    style: TextStyle(
                        color: ColorConstant.gd2,
                        fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Sign Up Button with gradient
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
          gradient: LinearGradient(
            colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          "Sign Up to Rajnigandha Business Club",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
    );
  }

  // Input field decoration
  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(30),
    );
  }
}