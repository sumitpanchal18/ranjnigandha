import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../images.dart';

class BaseScreenTwo extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? rightComponent; // 🔹 Flexible right-side component

  const BaseScreenTwo({
    super.key,
    required this.body,
    required this.title,
    this.rightComponent, // 🔹 Pass any widget here
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows background image to be full-screen
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          /// 🔹 Background Image
          Positioned.fill(
            child: SvgPicture.asset(
              AppImages.appBackground, // Your SVG background image
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Page Content
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: body,
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Get.back(),
      ),
      actions: [
        if (rightComponent != null) Padding(
          padding: const EdgeInsets.only(right: 16),
          child: rightComponent!,
        ),
      ],
    );
  }
}
