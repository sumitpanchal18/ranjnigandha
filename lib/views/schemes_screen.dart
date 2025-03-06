import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/images.dart';
import 'package:rajanigandha/widgets/custom_button.dart';
import '../utils/color_constant.dart';

class SchemesScreen extends StatelessWidget {
  final List<Map<String, String>> winners2022 = [
    {
      "image": AppImages.imgPulse,
      "title": "Rajnigandha Scratch Card Silver Coin Winner"
    },
    {
      "image": AppImages.imgPulse,
      "title": "Rajnigandha Silver Coin Winner"
    }
  ];

  final List<Map<String, String>> winners2021 = [
    {
      "image": AppImages.imgPulse,
      "title": "Rajnigandha Scratch Card Silver Coin Winner"
    },
    {
      "image": AppImages.imgPulse,
      "title": "Rajnigandha Silver Coin Winner"
    }
  ];

  SchemesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: 'Schemes',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            /// **Banner Image with Play Button Overlay**
            buildBannerImage(),

            /// **Description Section**
            buildDescription(),

            /// **Buttons for Scheme Selection**
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppGradientButton(
                text: "Wholesale / Distributor Scheme",
                onPressed: () {},
                height: 40,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppGradientButton(text: "Retailer Scheme", onPressed: () {}, height: 40,),
            ),
            const SizedBox(height: 40),

            /// **Winners Sections**
            WinnerCarousel(),
            const SizedBox(height: 40),
            WinnerCarousel(),
          ],
        ),
      ),
    );
  }

  /// **Banner Image with Play Button**
  Widget buildBannerImage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.asset(
              AppImages.imgPulse,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow,
                      color: Colors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Description Text Content**
  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          descriptionText(
            'Rajnigandha Pan Masala has always considered trade partners as vital associates in its endeavour to be the most premium quality Pan Masala Brand. In order to uplift their position and maintain a strong relation in the trade fraternity, Rajnigandha has launched a trade scheme "Festive Celebrations 22" Scratch Card Scheme.',
          ),
          descriptionText(
            'All the wholesalers, traders, private bankers, distributors etc., can be a part of this mega scheme. This scheme is valid across India except States of Maharashtra, Tamil Nadu, Andhra Pradesh, Telangana, Kerala, Bihar. Under Cash-out Offer, on purchase of 6kg, 10kg, 15kg, 20kg, 30kg, 80kg, 100kg and 1kg, one SCRATCH CARD is given.',
          ),
          descriptionText(
            "Many of the SCRATCH CARDS will have gifts like Bikes, LED TVs, Mobile Phones, Silver Points 50g and 100g.",
          ),
        ],
      ),
    );
  }

  /// **Reusable Text Widget for Description**
  Widget descriptionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 14,
        ),
      ),
    );
  }
}

class WinnerCarousel extends StatelessWidget {
  final List<Map<String, String>> winners = [
    {
      "image": AppImages.imgPulse,
      "title": "Rajnigandha Scratch Card Silver Coin Winner"
    },
    {
      "image": AppImages.imgPulse,
      "title": "Rajnigandha Silver Coin Winner"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// **Main Outer Container with Border**
          Container(
            width: 350,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF001F3F), // Deep blue background
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.amber, width: 1.5),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30), // Space for Year Header

                /// **Carousel Slider - Aligned from Start**
                Align(
                  alignment: Alignment.centerLeft, // Start from left
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 260,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.55, // Reduce spacing
                      initialPage: 0, // Ensure first item is displayed first
                      enlargeCenterPage: false, // Prevent center alignment
                    ),
                    items: winners.map((item) {
                      return buildWinnerCard(item["image"]!, item["title"]!);
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 10),

                /// **Pagination Dots**
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    winners.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: index == 0 ? 18 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.amber : Colors.white54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// **Year Header Positioned on Top**
          Positioned(
            top: -22,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber.shade700, Colors.amber.shade400],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Text(
                  "2022",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Winner Card Widget**
  Widget buildWinnerCard(String image, String title) {
    return Container(
      width: 170,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          /// **Image with Rounded Corners**
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// **Winner Title**
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber.shade700, Colors.amber.shade400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



