import 'package:flutter/material.dart';

class Logwith extends StatelessWidget {
  const Logwith({required this.name, required this.picture});
  final String name;
  final String picture;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 379,
      padding: const EdgeInsets.symmetric(
          horizontal: 40, vertical: 12), // Adjust padding
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF20776B)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(picture),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            // Make sure the text doesn't overflow
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 1.2, // Fix the line height
                letterSpacing: -0.42,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
