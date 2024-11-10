import 'package:flutter/material.dart';

class Logwith extends StatelessWidget {
  const Logwith({required this.picture});
  final String picture;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define container dimensions based on screen size
    final containerWidth = screenWidth * 0.12;
    final containerHeight = screenHeight * 0.054;
    final paddingHorizontal = screenWidth * 0.02;

    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          picture,
          width: containerWidth * 0.5, // Scale image to fit within container
          height: containerHeight * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
