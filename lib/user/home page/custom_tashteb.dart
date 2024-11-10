import 'package:flutter/material.dart';

class CustomTashteb extends StatelessWidget {
  const CustomTashteb({
    required this.photo,
    required this.price,
    required this.tittle,
  });

  final String photo;
  final String tittle;
  final String price;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the device dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive dimensions based on screen width
    final double containerWidth = screenWidth * 0.65; // 70% of screen width
    final double containerHeight =
        containerWidth * 0.9; // Maintain aspect ratio
    final double imageHeight =
        containerHeight * 0.65; // 65% of container height
    final double fontSize =
        containerWidth * 0.056; // Font size relative to container width

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, bottom: 37),
      child: Stack(
        children: [
          // Main Container with Shadow and Rounded Borders
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(8.76),
                  bottomRight: Radius.circular(8.76),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4.38,
                  offset: Offset(0, 4.38),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
          // Image Filling the Top Part with Rounded Corners
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Image.asset(
                photo, // Replace with your image path
                width: containerWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black Overlay with Adjustable Opacity
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                width: containerWidth,
                height: imageHeight,
                color: Colors.black
                    .withOpacity(0.3), // Set black overlay with opacity
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            right: 10,
            child: Text(
              tittle,
              style: TextStyle(
                color: const Color(0xFF252525),
                fontSize: fontSize,
                fontFamily: 'noto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 183,
            child: Row(
              children: [
                const Text(
                  ' جنية',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF20776B),
                    fontSize: 14.23,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF20776B),
                    fontSize: fontSize,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
