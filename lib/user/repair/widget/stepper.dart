import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CustomStepper extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomStepper(
      {required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.cont1,
      required this.cont2});
  final Color icon3;
  final Color icon2;
  final Color icon1;
  final Color text3;
  final Color text2;
  final Color text1;
  final Color cont2;
  final Color cont1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.9.w, left: 5.9.w),
      child: Column(
        children: [
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                IconsaxPlusBold.tick_circle,
                color: icon3,
                size: 4.2.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                width: 23.w,
                height: .8.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: cont2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.h),
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Icon(
                IconsaxPlusBold.tick_circle,
                color: icon2,
                size: 4.2.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                width: 23.w,
                height: .8.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: cont1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.h),
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Icon(
                IconsaxPlusBold.tick_circle,
                color: icon1,
                size: 4.2.h,
              ),
            ],
          ),
          SizedBox(
            height: 1.3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التأكيد',
                style: TextStyle(
                  color: text3,
                  fontSize: 14.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: -0.42,
                ),
              ),
              Text(
                'تحديد الموعد ',
                style: TextStyle(
                  color: text2,
                  fontSize: 14.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: -0.42,
                ),
              ),
              Text(
                'المشكلة',
                style: TextStyle(
                  color: text1,
                  fontSize: 14.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: -0.42,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
