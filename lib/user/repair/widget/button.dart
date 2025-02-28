import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.name}); // Added `super.key`

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      padding: EdgeInsets.all(1.h),
      decoration: ShapeDecoration(
        color: const Color(0xFF8A8A8A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.h),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
              height: 1.2, // Fixed the height value
            ),
          ),
        ],
      ),
    );
  }
}
