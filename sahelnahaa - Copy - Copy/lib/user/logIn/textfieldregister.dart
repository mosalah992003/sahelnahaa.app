import 'package:flutter/material.dart';

class Textfieldregister extends StatelessWidget {
  const Textfieldregister({required this.name, Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  fontSize: 16,
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
