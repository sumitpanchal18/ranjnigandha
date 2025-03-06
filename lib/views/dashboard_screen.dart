import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/images.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final CarouselSliderController _controller = CarouselSliderController(); // Controller for slider
  int activeIndex = 0; // To track current slide index

  final List<String> imagePaths = [
    "assets/images/png/sliderImg1.png",
    "assets/images/png/sliderImg2.png",
    "assets/images/png/sliderImg3.png",
  ];


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Dashboard',
      rightButton: Row(
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Get.toNamed(Routes.cart);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.toNamed(Routes.notificationScreen);
            },
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              _buildImageSlider(),
              SizedBox(height: Get.height * 0.02),
              _buildButtonsSection(),
              SizedBox(height: Get.height * 0.03),
              _buildBrandTVCSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Image Slider with Animated Indicators
  Widget _buildImageSlider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: imagePaths.map((path) => _buildImage(path)).toList(),
            options: CarouselOptions(
              height: Get.height * 0.2,
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

          // Dot Indicator
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imagePaths.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Color(0xFFFFC107),
              dotColor: Color(0xFF5E5E5E),
              expansionFactor: 2.5,
              spacing: 6,
            ),
            onDotClicked: (index) {
              _controller.animateToPage(index);
            },
          ),
        ],
      ),
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
        fit: BoxFit.fill,
      ),
    );
  }

  /// 🔹 Earn, Redeem, Transaction Buttons Section
  Widget _buildButtonsSection() {
    return Column(
      children: [
        _buildButton(Icons.monetization_on, "Earn Point"),
        _buildButton(Icons.card_giftcard, "Redeem Points"),
        _buildButton(Icons.history, "Transaction History"),
      ],
    );
  }

  /// 🔹 Brand TVC Section with Image Cards
  /// 🔹 Brand TVC Section with Image Cards
  Widget _buildBrandTVCSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brand TVC",
                style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.brandTvc);
                },
                child: Text(
                  "View All",
                  style: TextStyle(color: Color(0xFFDA9828), fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Get.height * 0.015),

        // Wrap the Row in a SingleChildScrollView to prevent overflow
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Allow horizontal scrolling
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align to the left
              children: [
                VideoCard(index: 1),
                VideoCard(index: 2),
                VideoCard(index: 3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 🔹 Custom Button for Actions
  Widget _buildButton(IconData icon, String title) {
    return InkWell(
      onTap: () {
        // Perform action based on the button clicked
        if(title == "Earn Point") {
          Get.toNamed(Routes.earnPoint);
        }
        if(title == "Redeem Points") {
          Get.toNamed(Routes.redeemPoints);
        }
        if(title == "Transaction History") {
          Get.toNamed(Routes.transactionHistory);
        }
      },
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.08,
        margin: EdgeInsets.only(bottom: Get.height * 0.015),
        decoration: BoxDecoration(color: const Color(0xFF020E3F), borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(width: Get.width * 0.05),
            Icon(icon, color: Colors.white, size: Get.width * 0.07),
            SizedBox(width: Get.width * 0.04),
            Text(title, style: TextStyle(color: Colors.white, fontSize: Get.width * 0.045, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

}


class VideoCard extends StatelessWidget {
  final int index;
  const VideoCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AppImages.placeholder, // Path to your placeholder image
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

