import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BrandTVCScreen(),
  ));
}

class BrandTVCScreen extends StatefulWidget {
  const BrandTVCScreen({Key? key}) : super(key: key);

  @override
  _BrandTVCScreenState createState() => _BrandTVCScreenState();
}

class _BrandTVCScreenState extends State<BrandTVCScreen> {
  int _currentIndex = 2;
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
     title: 'Brand TVC',
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
          Column(
            children: [
              // SizedBox(
              //   height: 70,
              //   child: AppBar(
              //     actionsIconTheme: const IconThemeData(color: Colors.white),
              //     backgroundColor: Colors.transparent,
              //     elevation: 0,
              //     title: const Text("Brand TVC", style: TextStyle(color: Colors.white)),
              //   ),
              // ),
              // Category filter (Horizontal List)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Divider(
                      color: ColorConstant.gd1,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryChip(
                            label: 'All',
                            isSelected: _selectedCategory == 'All',
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'All';
                              });
                            },
                          ),
                          CategoryChip(
                            label: 'Pan Masala',
                            isSelected: _selectedCategory == 'Pan Masala',
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'Pan Masala';
                              });
                            },
                          ),
                          CategoryChip(
                            label: 'Silver Pearls',
                            isSelected: _selectedCategory == 'Silver Pearls',
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'Silver Pearls';
                              });
                            },
                          ),
                          CategoryChip(
                            label: 'Clove Pan Masala',
                            isSelected: _selectedCategory == 'Clove Pan Masala',
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'Clove Pan Masala';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorConstant.gd1,
                    ),
                  ],
                ),
              ),
              // Grid of Brand TVCs (Videos)
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items per row
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return VideoCard(index: index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;

  const CategoryChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Chip(
          label: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          backgroundColor: isSelected ? ColorConstant.gd2 : ColorConstant.product_bgclr,
          shape: StadiumBorder(
            side: BorderSide(
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
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
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
