import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

import '../utils/routes.dart';
import '../widgets/custom_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isDescriptionTab = true;

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: 'Product Detail',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView( // <-- Added Scroll View
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.imgPulse,
                    fit: BoxFit.contain,
                    height: 180,
                  ),
                ),
              ),

              // Product Thumbnails
              const SizedBox(height: 10),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _buildThumbnail(AppImages.imgPulse),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              // Product Title & Points
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pulse Kachcha Aam Candy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Points: 300",
                        style: TextStyle(
                          color: ColorConstant.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  // Quantity Selector
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorConstant.appColor, ColorConstant.appColor],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A4D8F),
                            border: Border.all(color: ColorConstant.gd2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            child: const Icon(Icons.remove, color: Colors.white, size: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorConstant.gd2,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: const Icon(Icons.add, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),
              Text(
                "Net Weight : 190",
                style: TextStyle(
                  color: ColorConstant.gd2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "In Stock : Yes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Tabs
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _buildTab("Description", isDescriptionTab),
                    _buildTab("Details", !isDescriptionTab),
                  ],
                ),
              ),

              // Description Text
              const SizedBox(height: 15),
              const Text(
                "PULSE is a hard boiled candy, with a tangy twist. A category breaker in the hard-boiled candy segment ‘Pulse’ is a different experience that begins with the taste of fruity flavour and peaks with a tangy surprise. The unique and innovative combination of various flavours has made Pulse stand out and become a nationwide favourite.Pulse is available in four flavours - Kachcha Aam, Guava, Orange and Pineapple. Each flavour has the burst of tanginess, a mouth full of fun and peculiarity that is alluring. This irresistible fervour for Pulse candy is extended to the brand communication, with a tag line of ‘Pran jaaye par Pulse na jaaye’.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 20),
              AppGradientButton(
                text: "Redeem Now",
                onPressed: () {
                  Get.toNamed(Routes.redeemCart);
                },
              ),

              const SizedBox(height: 20), // Extra space to avoid overflow
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 75,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDescriptionTab = text == "Description";
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : ColorConstant.appColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.blue.shade900 : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
