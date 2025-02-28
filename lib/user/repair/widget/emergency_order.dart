import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class EmergencyOrder extends StatefulWidget {
  const EmergencyOrder({super.key});

  @override
  State<EmergencyOrder> createState() => _EmergencyOrderState();
}

class _EmergencyOrderState extends State<EmergencyOrder> {
  Color _containerColor = const Color(0xFF9E9B9B); // Default color

  void _toggleColor() {
    setState(() {
      // Toggle between the default color and the active color
      _containerColor = _containerColor == const Color(0xFF9E9B9B)
          ? const Color(0xFFB74242)
          : const Color(0xFF9E9B9B);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 65.w,
          height: 4.3.h,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FDEE0E4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.h),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: const Icon(Icons.info),
              ),
              Text(
                'هل تريد الخدمة اليوم طارئة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF23334A),
                  fontSize: 14.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: -0.36,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        GestureDetector(
          onTap: _toggleColor, // Change the color when tapped
          child: Container(
            width: 23.w,
            height: 4.7.h,
            padding: EdgeInsets.all(1.h),
            decoration: ShapeDecoration(
              color: _containerColor, // Use the current color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.h)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'طلب فوري',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFFE0DEDE),
                    fontSize: 15.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                    letterSpacing: -0.45,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
