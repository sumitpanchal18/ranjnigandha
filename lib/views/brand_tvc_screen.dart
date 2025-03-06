import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/color_constant.dart';
import 'package:rajanigandha/utils/images.dart';
import 'package:rajanigandha/widgets/category_item.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: ColorConstant.gd1),
                  ),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryItem(
                            isSelected: _selectedCategory == 'All',
                            selectedBackgroundColor: ColorConstant.gd1,
                            unselectedBorderColor: ColorConstant.appColor,
                            selectedBorderColor: ColorConstant.gd1,
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'All';
                              });
                            }, title: 'All',
                          ),
                          SizedBox(width: 20),
                          CategoryItem(
                            isSelected: _selectedCategory == 'Pan Masala',
                            selectedBackgroundColor: ColorConstant.gd1,
                            unselectedBorderColor: ColorConstant.appColor,
                            selectedBorderColor: ColorConstant.gd1,
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'Pan Masala';
                              });
                            }, title: 'Pan Masala',
                          ),
                          SizedBox(width: 20),
                          CategoryItem(
                            isSelected: _selectedCategory == 'Silver Pearls',
                            selectedBackgroundColor: ColorConstant.gd1,
                            unselectedBorderColor: ColorConstant.appColor,
                            selectedBorderColor: ColorConstant.gd1,
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'Silver Pearls';
                              });
                            }, title: 'Silver Pearls',
                          ),
                          SizedBox(width: 20),
                          CategoryItem(
                            isSelected: _selectedCategory == 'Clove Pan Masala',
                            selectedBackgroundColor: ColorConstant.gd1,
                            unselectedBorderColor: ColorConstant.appColor,
                            selectedBorderColor: ColorConstant.gd1,
                            onTap: () {
                              setState(() {
                                _selectedCategory = 'Clove Pan Masala';
                              });
                            }, title: 'Clove Pan Masala',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
              color: isSelected ? Colors.black : Colors.black,
            ),
          ),
          backgroundColor: isSelected ? ColorConstant.gd2 : ColorConstant.appColor,
          shape: StadiumBorder(
            side: BorderSide(
              width: 0,
              color: isSelected ? ColorConstant.gd2 : ColorConstant.gd2,
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
