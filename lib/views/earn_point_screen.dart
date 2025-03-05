import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

class EarnPointsScreen extends StatefulWidget {
  const EarnPointsScreen({Key? key}) : super(key: key);

  @override
  _EarnPointsScreenState createState() => _EarnPointsScreenState();
}

class _EarnPointsScreenState extends State<EarnPointsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Earn Points',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16, bottom: 10,top: 16),
            child: Card(
              color: ColorConstant.product_bg_clor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12.0),
                child: Row(

                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.product_bgclrsg,
                      ),
                      child: Image.asset(
                        AppImages.cashBalanceSym,
                        color: ColorConstant.gd2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Earn Points',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      '605',
                      style: TextStyle(
                        color: ColorConstant.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          // Main content
          Expanded(
            child: Padding(
              padding: EdgeInsets.zero,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildTextField('Account number', 'DSG-Ise43pok', true),
                    const SizedBox(height: 16),
                    _buildTextField('Account Balance', '1000', true),
                    const SizedBox(height: 16),
                    _buildTextField('Enter Sr. Number', 'Enter Sr. number', true),
                    const SizedBox(height: 16),
                    _buildTextField('Enter Coupon code', 'Enter Coupon code (Max up to 15)', true),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: _buildButton('Submit'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildButton('Scan & Earn'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, bool isEditable) {
    return TextField(
      enabled: isEditable,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow[700]!),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.white),
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
            colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
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

}
