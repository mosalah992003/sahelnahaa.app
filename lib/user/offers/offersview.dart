import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/offers/cards.dart';
import 'package:sahelnahaa/user/repair/details/location_time.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Offersview extends StatelessWidget {
  const Offersview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Column(
        children: [
          // Existing Container
          Container(
            width: double.infinity,
            height: 34.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.h),
                  bottomRight: Radius.circular(4.h),
                ),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/cards/logo.png",
                      width: 10.w,
                      height: 3.h,
                    ),
                  ),
                  SizedBox(height: 1.4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/shop/offers.png",
                        width: 30.w,
                        height: 15.h,
                      ),
                      SizedBox(width: 2.5.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'تمتع الآن',
                                    style: TextStyle(
                                      color: const Color(0xFF20776B),
                                      fontSize: 18.sp,
                                      fontFamily: 'noto',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nبأفضل العروض مع ',
                                    style: TextStyle(
                                      color: const Color(0xFF232323),
                                      fontSize: 18.sp,
                                      fontFamily: 'noto',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'سهلناها',
                                    style: TextStyle(
                                      color: const Color(0xFF20776B),
                                      fontSize: 18.sp,
                                      fontFamily: 'noto',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 1.5.h),
                            Container(
                              width: 53.w,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 2,
                                    color: Color(0xFF20776B),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.4.h),
                            Text(
                              'عروض على الخدمات بـأنواعها',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 1.2.h),
                            Text(
                              'عروض على منتجات الماركت',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 1.2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/shop/image 22.png",
                                  width: 9.w,
                                  height: 3.5.h,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  'عروض على الدفع بالطرق الالكترونية',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ListView with RTL Direction
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ListView(
                  children: [
                    Text("عروض الخدمات",
                        style: TextStyle(
                          color: const Color(0xFF3E3E3E),
                          fontSize: 15.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          height: 0.09,
                        )),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    const Cards(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'عروض مواقع التسوق',
                      style: TextStyle(
                        color: const Color(0xFF3E3E3E),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 1.4.h),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationTime(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/shop/Group 34311.png",
                            width: 17.w,
                            height: 7.h,
                          ),
                          Image.asset(
                            "assets/shop/Group 34312.png",
                            width: 17.w,
                            height: 7.h,
                          ),
                          Image.asset(
                            "assets/shop/Group 34313.png",
                            width: 17.w,
                            height: 7.h,
                          ),
                          Image.asset(
                            "assets/shop/Group 34314.png",
                            width: 17.w,
                            height: 7.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Text(
                      'عروض اخرى',
                      style: TextStyle(
                        color: const Color(0xFF3E3E3E),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationTime(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/shop/Group 34315.png",
                            width: 18.w,
                            height: 12.h,
                          ),
                          Image.asset(
                            "assets/shop/Group 34316.png",
                            width: 18.w,
                            height: 12.h,
                          ),
                          Image.asset(
                            "assets/shop/Group 34317.png",
                            width: 18.w,
                            height: 12.h,
                          ),
                          Image.asset(
                            "assets/shop/Group 34318.png",
                            width: 18.w,
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
