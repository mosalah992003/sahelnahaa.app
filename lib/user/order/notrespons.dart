import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Notrespons extends StatelessWidget {
  final VoidCallback onReject;
  final VoidCallback onAccept;

  const Notrespons({super.key, required this.onReject, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(2.h),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: .5, color: Color(0xFFD6D4D4)),
            borderRadius: BorderRadius.circular(2.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عرض الملف الشخصي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 13.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      height: 1.20,
                      letterSpacing: -0.36,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconsaxPlusBold.star,
                        color: Colors.yellow,
                        size: 2.5.h,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '4.6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF705D5D),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          height: 1.20,
                          letterSpacing: -0.27,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 1.h),
                          Text(
                            'محمد إبراهيم ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'سباكة',
                            style: TextStyle(
                              color: const Color(0xFF8E8E8E),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1.w),
                      Container(
                        width: 9.w,
                        height: 4.5.h,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'الموعد',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF8B8B8B),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: .5.h),
                      Row(
                        children: [
                          Text(
                            '3 ديسمبر - 10 صباحاً',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Icon(
                            IconsaxPlusBold.calendar,
                            color: const Color(0xff20776b),
                            size: 2.5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'السعر',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF8B8B8B),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: .5.h),
                      Row(
                        children: [
                          Text(
                            '70 جنية للمعاينة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Icon(
                            IconsaxPlusBold.dollar_circle,
                            color: const Color(0xff20776b),
                            size: 2.5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onReject,
                    child: Container(
                      width: 40.w,
                      height: 5.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(-0.66, 0.75),
                          end: const Alignment(0.66, -0.75),
                          colors: [
                            Colors.white.withOpacity(0.800000011920929),
                            Colors.white.withOpacity(0.800000011920929),
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.800000011920929),
                            Colors.white.withOpacity(0.800000011920929),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1.40, color: Color(0xFF20776B)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'رفض العرض',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF20776B),
                            fontSize: 15.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                            height: 1.71,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onAccept,
                    child: Container(
                      width: 40.w,
                      height: 5.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-0.66, 0.75),
                          end: Alignment(0.66, -0.75),
                          colors: [
                            Color(0xFF2A8C7F),
                            Color(0xff207768),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1.40, color: Color(0xFF2DB09E)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'قبول العرض',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                            height: 1.71,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Text(
                      'تم إرسال العرض من قبل مقدم الخدمة في انتظار ردك',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: const Color(0xFF494949),
                        fontSize: 13.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Icon(
                    IconsaxPlusLinear.info_circle,
                    color: Colors.yellow[600],
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
            ],
          ),
        ),
      ),
    );
  }
}
