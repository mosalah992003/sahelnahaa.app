import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

// ignore: camel_case_types
class profilecontainer extends StatelessWidget {
  const profilecontainer(
      {required this.text,
      required this.text2,
      required this.text3,
      super.key});
  final String text;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 8.h,
      padding: const EdgeInsets.only(top: 6, left: 4, right: 4, bottom: 3),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFC2BFBF)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14102535),
            blurRadius: 16,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF1E272E),
              fontSize: 13.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w400,
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text3,
                  style: TextStyle(
                    color: const Color(0xFF20776B),
                    fontSize: 16.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  text2,
                  style: TextStyle(
                    color: const Color(0xFF747D8C),
                    fontSize: 14.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
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
