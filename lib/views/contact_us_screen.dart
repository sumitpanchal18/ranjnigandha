import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/images.dart';

import '../widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ContactUsScreen(),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Contact Us",
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildContactForm(),
            _buildCompanyInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildInputRow([
            _buildInputField("Query Type", flex: 2),
          ]),
          _buildInputRow([
            _buildInputField("Sub-Query Type", flex: 2),
          ]),
          _buildInputRow([
            _buildInputField("Full Name", flex: 2),
          ]),
          _buildInputRow([
            _buildInputField("Contact Number", flex: 2),
          ]),
          _buildInputRow([
            _buildInputField("Email Id", flex: 2),
          ]),
          _buildInputRow([
            _buildInputField("Address", flex: 2),
          ]),
          _buildInputRow([
            _buildInputField("City", flex: 2),
          ]),
          _buildFilePicker(),
          _buildDescriptionField(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton("Submit"),
              _buildButton("FAQ"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: children,
      ),
    );
  }

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

  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          hintText: "Description",
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Choose Files",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 10),
            const Text("No File Chosen", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return AppGradientButton(
      width: 150,
      height: 43,
      text: text,
      onPressed: () {},
    );
  }

  Widget _buildCompanyInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF03174C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "DHARAMPAL SATYAPAL LTD.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          const SizedBox(height: 10),
          Text(
            "Sector-67, Noida-201309 (U.P.) India",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildContactInfo(Icons.phone, "Phone:" ,"+91-120-4032200"),
          const SizedBox(height: 10),
          _buildContactInfo(Icons.email, "Email:" ,"rajnigandha@dsgroup.com"),
          const SizedBox(height: 20),
          _buildMapView(),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon,String title , String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey,
          ),
          child: Icon(icon, color: Colors.amber, size: 24),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMapView() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Image.asset(
          AppImages.mapImg,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

}
