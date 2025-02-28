import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        height: 5.h,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x7FDEE0E4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.info),
            SizedBox(
              width: 3.w,
            ),
            const Expanded(
              child: Text(
                'إلغاء مجاني إلى قبل وصول العامل ب 12 ساعة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF23334A),
                  fontSize: 12,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                  height: 1.2, // Fixed the height value to be valid
                  letterSpacing: -0.36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
