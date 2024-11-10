import 'package:flutter/material.dart';

class Textfieldregister extends StatelessWidget {
  const Textfieldregister({required this.name, Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Set consistent sizes based on screen dimensions
    final double containerWidth =
        screenWidth > 400 ? 380 : screenWidth * 0.9; // Responsive width
    final double containerHeight = 56; // Fixed height
    final double paddingHorizontal =
        screenWidth * 0.04; // 4% of screen width for horizontal padding
    final double paddingVertical =
        screenHeight * 0.01; // 1% of screen height for vertical padding
    final double hintFontSize =
        screenWidth * 0.04; // Responsive hint text font size

    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.right, // Align text to the right
              textDirection:
                  TextDirection.rtl, // Set text direction to right-to-left
              decoration: InputDecoration(
                hintText: name, // Use the name as hint text
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: hintFontSize, // Responsive hint text font size
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none, // Remove the default border
              ),
            ),
          ),
        ],
      ),
    );
  }
}
