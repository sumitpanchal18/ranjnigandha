import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final Color? selectedBackgroundColor;
  final Color? unselectedBackgroundColor;
  final double? height;
  final double? width;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedBackgroundColor,
    this.unselectedBackgroundColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedBackgroundColor ?? const Color(0xFFDA9828))
              : (unselectedBackgroundColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (selectedBorderColor ?? const Color(0xFFDA9828))
                : (unselectedBorderColor ?? const Color(0xFFDA9828)),
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? (selectedTextColor ?? Colors.black)
                : (unselectedTextColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
