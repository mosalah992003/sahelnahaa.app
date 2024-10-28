import 'package:flutter/material.dart';

class CustomTashteb extends StatelessWidget {
  const CustomTashteb(
      {required this.photo, required this.price, required this.tittle});
  final String photo;
  final String tittle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, bottom: 37),
      child: Stack(
        children: [
          // Main Container with Shadow and Rounded Borders
          Container(
            width: 262.76,
            height: 236.48,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(52.55),
                  topRight: Radius.circular(52.55),
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
                topLeft: Radius.circular(52.55),
                topRight: Radius.circular(52.55),
              ),
              child: Image.asset(
                photo, // Replace with your image path
                width: 262.76,
                height: 155.47,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black Overlay with Adjustable Opacity
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(52.55),
                topRight: Radius.circular(52.55),
              ),
              child: Container(
                width: 262.76,
                height: 155.47,
                color: Colors.black
                    .withOpacity(0.3), // Set black overlay with opacity
              ),
            ),
          ),
          Positioned(
              bottom: 43,
              right: 10,
              child: Text(
                tittle,
                style: const TextStyle(
                  color: Color(0xFF252525),
                  fontSize: 14.23,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                ),
              )),
          Positioned(
            bottom: 15,
            right: 180,
            child: Row(
              children: [
                const Text(
                  ' جنية',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF20776B),
                    fontSize: 14.23,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF20776B),
                    fontSize: 14.23,
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
