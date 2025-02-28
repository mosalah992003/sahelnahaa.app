// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Defineproblem extends StatelessWidget {
  const Defineproblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 16.h, // Set the height directly
        decoration: BoxDecoration(
          color: const Color(0xFFE7E7E7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'وصف المشكلة (إختياري)',
            hintStyle: TextStyle(
              color: const Color(0xFF676767),
              fontSize: 14.3.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: Icon(
                IconsaxPlusLinear.message_2,
                color: const Color(0xFF6E6C6C),
                size: 3.h,
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 1.h),
          ),
        ),
      ),
    );
  }
}
