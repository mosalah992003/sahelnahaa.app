import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Success2 extends StatelessWidget {
  final String phoneNumber;
  final String address;
  final double totalAmount;

  const Success2({
    super.key,
    required this.phoneNumber,
    required this.address,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'تفاصيل الحجز',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.60,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Image.asset(
            "assets/shop/freepik__background__12450.png",
            width: 45.w,
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, top: 3.h, right: 5.w),
            child: Center(
              child: Text(
                'شكرا لك , حجزك تم بنجاح',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.84,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 10.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Center(
                child: Text(
                  'من فضلك تابع أيميلك و الرقم المعطى وانتظر مكالمة التوصيل\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF424242),
                    fontSize: 16.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -0.48,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, right: 5.w, left: 5.w),
            child: Material(
              color: Colors.white,
              elevation: 2,
              borderRadius: BorderRadius.circular(2.h),
              child: Container(
                width: double.infinity,
                height: 34.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 13.w,
                            height: 5.h,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/shop/image 3.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(37.50),
                              ),
                            ),
                          ),
                          Text(
                            'عدد 1 مكوة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF20776B),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.w,
                      ),
                      Divider(
                        endIndent: 5.w,
                        indent: 5.w,
                        thickness: .2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الأربعاء 5 مارس ',
                            style: TextStyle(
                              color: const Color(0xFF313131),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.39,
                            ),
                          ),
                          Text(
                            'معاد التسليم',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.36,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Divider(
                        endIndent: 5.w,
                        indent: 5.w,
                        thickness: .2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            phoneNumber, // Display phone number from Payment
                            style: TextStyle(
                              color: const Color(0xFF313131),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.39,
                            ),
                          ),
                          Text(
                            'رقم التواصل ',
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.39,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Divider(
                        endIndent: 5.w,
                        indent: 5.w,
                        thickness: .2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            address, // Display address from Payment
                            style: TextStyle(
                              color: const Color(0xFF313131),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.39,
                            ),
                          ),
                          Text(
                            'العنوان ',
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.39,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: const BoxDecoration(color: Color(0xFFF7F4FB)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 1.h,
                        clipBehavior: Clip.antiAlias,
                        decoration:
                            const BoxDecoration(color: Color(0xFF20776B)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'الأجمالى',
                              style: TextStyle(
                                color: const Color(0xFF777777),
                                fontSize: 14.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.39,
                              ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text(
                              'جنية$totalAmount', // Display total amount from Payment
                              style: TextStyle(
                                color: const Color(0xFF20776B),
                                fontSize: 18.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MarketView(),
                              ),
                            );
                          },
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF207768),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.h),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'تم بنجاح',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.48,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
