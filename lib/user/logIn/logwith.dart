import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Logwith extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Logwith({required this.picture});
  final String picture;

  @override
  Widget build(BuildContext context) {
    // Define container dimensions based on screen size

    return Container(
      width: 11.4.w,
      height: 5.h,
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.h),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          picture,
          width: 7.w, // Scale image to fit within container
          height: 4.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
