import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool isTermsChecked = false;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: 'Update Profile',
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update your profile and Get additional Rewards Points",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "Edit Your Profile",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  _buildInputRow([
                    _buildInputField("First Name", flex: 1),
                    const SizedBox(width: 10),
                    _buildInputField("Last Name", flex: 1),
                  ]),

                  // Mobile Number
                  _buildInputRow([
                    _buildInputField("Mobile Number", flex: 2),
                  ]),

                  // Email Address
                  _buildInputRow([
                    _buildInputField("Email Address", flex: 2),
                  ]),

                  // Date of Birth
                  _buildInputRow([
                    _buildInputField("Date of Birth", flex: 2),
                  ]),

                  // Gender Selection
                  _buildGenderSelection(),

                  // Registered Address
                  _buildSectionHeader("Registered Address"),
                  _buildInputRow([
                    _buildInputField("Address 1", flex: 2),
                  ]),
                  _buildInputRow([
                    _buildInputField("Address 2", flex: 2),
                  ]),
                  _buildInputRow([
                    _buildInputField("Pincode", flex: 2),
                  ]),
                  _buildInputRow([
                    _buildInputField("State", flex: 1),
                  ]),
                  _buildInputRow([
                    _buildInputField("City", flex: 2),
                  ]),

                  // Shipping Address
                  _buildSectionHeader("Your Shipping Address"),
                  _buildInputRow([
                    _buildInputField("Address 1", flex: 2),
                  ]),
                  _buildInputRow([
                    _buildInputField("Address 2", flex: 2),
                  ]),
                  _buildInputRow([
                    _buildInputField("Pincode", flex: 1),
                  ]),
                  _buildInputRow([
                    _buildInputField("State", flex: 1),
                  ]),
                  _buildInputRow([
                    _buildInputField("City", flex: 2),
                  ]),

                  // Terms and Conditions
                  _buildTermsCheckbox(),
                  const SizedBox(height: 10),
                  // Update and Cancel Buttons
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Gender Selection
  Widget _buildGenderSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value;
                });
              },
              activeColor: ColorConstant.gd2,
            ),
            const Text('Male',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value;
                });
              },
              activeColor: ColorConstant.gd2,
            ),
            const Text('Female',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  // Gender Select
  // Terms and Conditions Checkbox
  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: isTermsChecked,
          onChanged: (bool? value) {
            setState(() {
              isTermsChecked = value ?? false;
            });
          },
          activeColor: ColorConstant.gd2,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "I agree to ",
              style: const TextStyle(color: Colors.white, fontSize: 12),
              children: [
                TextSpan(
                  text: "Terms & Conditions",
                  style: TextStyle(
                    color: ColorConstant.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Update and Cancel Buttons
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildButton("Update"),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildButton("Cancel"),
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [Color(0xFFD8C694), Color(0xFFFFA000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: ColorConstant.product_bgclrsg,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  // Reusable Input Row Method
  Widget _buildInputRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: children,
      ),
    );
  }

  // Reusable Input Field
  Widget _buildInputField(String hint, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
