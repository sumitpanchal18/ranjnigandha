import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final TextStyle textStyle;
  final Gradient gradient;

  const AppGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 30,
    this.textStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    this.gradient = const LinearGradient(
      colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient,
        ),
        alignment: Alignment.center,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
