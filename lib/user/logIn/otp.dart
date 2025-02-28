import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/custom_otp.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF215F56), // The specific color you requested
              Color(0xff207768), // Your original background color
            ],
            stops: [0.1, 0.4], // Adjust the gradient stop to control height
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // Wrap Column with SingleChildScrollView
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w, // 10% horizontal padding
                vertical: 1.h, // 12% vertical padding
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'إدخل الرمز المرسل',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: "noto",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 3.h),
                  Image.asset(
                    "assets/images/Group 34163.png",
                    width: 50.w, // Responsive width
                    height: 24.h, // Responsive height
                  ),
                  SizedBox(height: 1.5.h),
                  Text(
                    'تم إرسال الرمز إلى حسابك الجيميل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 15.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      letterSpacing: -0.41,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const OtpTextField(),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'لم يتم إرسال الرمز؟',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.41,
                              ),
                            ),
                            TextSpan(
                              text: ' إعادة إرسال الرمز',
                              style: TextStyle(
                                color: const Color(0xFFF2A941),
                                fontSize: 14.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.41,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
