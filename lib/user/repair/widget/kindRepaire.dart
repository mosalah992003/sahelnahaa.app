// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/widget/customCheckBox.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Kindrepaire extends StatelessWidget {
  const Kindrepaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFE7E7E7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ListView(
            children: [
              SizedBox(height: 2.h),
              Text(
                'نوع المهمة',
                style: TextStyle(
                  color: const Color(0xFF20776B),
                  fontSize: 16.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.48,
                ),
              ),
              SizedBox(height: 1.h),
              _buildRepairOption('تغيير خلاط مطبخ أو حمام'),
              _buildRepairOption('تسريب مياه من الحوض'),
              _buildRepairOption('أعطال سخان'),
              _buildRepairOption('تغيير دش و تصليح بانيو'),
              _buildRepairOption('فك وتغيير وتصليح فلتر المياه'),
              _buildRepairOption('أخرى'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRepairOption(String text) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.end, // Align checkbox and text to the right
      children: [
        const CustomCheckbox(), // Checkbox first (on the right)
        Expanded(
          // Ensure text does not overflow
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF353535),
              fontSize: 14.3.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
