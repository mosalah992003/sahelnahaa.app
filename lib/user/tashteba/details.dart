import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/repair/details/location_time.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Details extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Details({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.price,
    required this.time,
    required this.profit1,
    required this.profit2,
    required this.profit3,
    required this.profit4,
  });
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String profit1;
  final String price;
  final String time;
  final String profit2;
  final String profit3;
  final String profit4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff207768),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff207768),
        title: Center(
          child: Text(
            'تشطيبة',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
              height: 0.07,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 9.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD0D0D0)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.h),
                    topRight: Radius.circular(7.h),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -6.h, // Adjust as needed
              left: 35.w,
              right: 35.w, // Center the container horizontally
              child: Container(
                width: double.infinity,
                height: 11.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFC8C8C8)),
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      width: 18.w,
                      height: 7.h,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 9.h,
              left: 27.w,
              right: 27.w,
              child: Text(
                text,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF1E6259),
                  fontSize: 17.5.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                  letterSpacing: -0.60,
                ),
              ),
            ),
            Positioned(
              top: 13.h,
              left: 5.w,
              right: 5.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      text1,
                      style: TextStyle(
                        color: const Color(0xFF656565),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
                    child: Image.asset(
                      image1,
                      height: 5.h,
                      width: 6.w,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(1.57),
                    child: Container(
                      width: 8.w,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF656565),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      text2,
                      style: TextStyle(
                        color: const Color(0xFF656565),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Image.asset(
                      image2,
                      height: 5.h,
                      width: 5.w,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(1.57),
                    child: Container(
                      width: 8.w,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF656565),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      text3,
                      style: TextStyle(
                        color: const Color(0xFF656565),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
                    child: Image.asset(
                      image3,
                      height: 5.h,
                      width: 5.w,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 25.h,
              left: 5.w,
              right: 5.w,
              child: Container(
                width: double.infinity,
                height: 15.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFA6A6A6)),
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.h, left: 10.w),
                      child: Column(
                        children: [
                          Icon(
                            IconsaxPlusBold.timer_1,
                            size: 3.5.h,
                            color: const Color(0xFF757575),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'الوقت المطلوب',
                            style: TextStyle(
                              color: const Color(0xFF757575),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              color: const Color(0xFF1A5850),
                              fontSize: 15.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Container(
                      color: const Color(0xFF656565),
                      height: 9.h,
                      width: 2,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h, right: 7.5.w),
                      child: Column(
                        children: [
                          Icon(
                            IconsaxPlusBold.dollar_circle,
                            size: 3.5.h,
                            color: const Color(0xFF757575),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'سعر الخدمة',
                            style: TextStyle(
                              color: const Color(0xFF757575),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Text(
                            price,
                            style: TextStyle(
                              color: const Color(0xFF1A5850),
                              fontSize: 15.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 42.h,
              right: 5.w,
              child: Text(
                'مزايا الخدمة',
                style: TextStyle(
                  color: const Color(0xFF1E5F56),
                  fontSize: 16.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 46.h,
              right: 7.w,
              child: Column(
                children: [
                  Text(
                    profit1,
                    style: TextStyle(
                      color: const Color(0xFF747474),
                      fontSize: 14.5.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    profit2,
                    style: TextStyle(
                      color: const Color(0xFF747474),
                      fontSize: 14.5.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    profit3,
                    style: TextStyle(
                      color: const Color(0xFF747474),
                      fontSize: 14.5.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    profit4,
                    style: TextStyle(
                      color: const Color(0xFF747474),
                      fontSize: 14.5.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 64.h,
              right: 5.w,
              left: 5.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationTime()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 6.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(-0.66, 0.75),
                      end: Alignment(0.66, -0.75),
                      colors: [Color(0xFF2A8C7F), Color(0xff207768)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.40, color: Color(0xFF2DB09E)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'طلب العرض',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
