import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

import '../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int activeIndex = 0; // Track active image index
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imagePaths = [
    "assets/images/png/sliderImg1.png",
    "assets/images/png/sliderImg2.png",
    "assets/images/png/sliderImg3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF021B79), Color(0xFF0575E6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Text
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Mobile Number Input with "Send OTP"
                  _buildTextField("Mobile Number", true),

                  const SizedBox(height: 15),

                  // OTP Input Field
                  _buildTextField("OTP", false),

                  const SizedBox(height: 30),

                  // Sign In Button
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(Routes.dashboard);
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
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have Rajanigandha Business account yet? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         Get.toNamed(Routes.signUp);
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorConstant.gd2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Carousel Slider with Dots
                  _buildImageSlider(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// **Builds Image Slider with Dot Indicators**
  Widget _buildImageSlider() {
    return Column(
      children: [
        // Image Slider
        CarouselSlider(
          carouselController: _controller,
          items: imagePaths.map((path) => _buildImage(path)).toList(),
          options: CarouselOptions(
            height: 140,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 7,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: 10),

        // Animated Dot Indicator
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: imagePaths.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: const Color(0xFFFFC107), // Yellow active dot
            dotColor: const Color(0xFF5E5E5E), // Gray inactive dots
            expansionFactor: 2.5,
            spacing: 6,
          ),
          onDotClicked: (index) {
            _controller.animateToPage(index);
          },
        ),
      ],
    );
  }

  /// **Helper function to build image items in the slider**
  Widget _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover, // Ensures image maintains aspect ratio
      ),
    );
  }

  /// **Reusable text field widget**
  Widget _buildTextField(String hint, bool hasSendOtp) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
              keyboardType: hasSendOtp ? TextInputType.phone : TextInputType.number,
            ),
          ),
          if (hasSendOtp)
            GestureDetector(
              onTap: () {
                // Send OTP action
              },
              child: Text(
                "Send OTP",
                style: TextStyle(
                  color: ColorConstant.gd2,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorConstant.gd2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
