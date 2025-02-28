import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/otp.dart'; // Import the OTP page
import 'package:sahelnahaa/user/logIn/textfieldregister.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w, // 10% horizontal padding
                vertical: 1.h, // 10% vertical padding
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'إعادة ',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: "noto",
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'تعيين ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "noto",
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'كلمة ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "noto",
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'المرور',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "noto",
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.h),
                  Image.asset(
                    "assets/images/Group.png",
                    width: 40.w, // 35% of screen width
                    height: 20.h, // 20% of screen height
                  ),
                  SizedBox(height: 6.h),
                  const Textfieldregister(name: 'الإيميل'),
                  SizedBox(height: 3.h),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the OTP page when the button is pressed
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Otp(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity, // 95% of screen width
                      height: 6.h, // 6% of screen height
                      decoration: ShapeDecoration(
                        color: const Color(0xffF2A941),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'إرسال الرمز',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                              height: 1, // Use height of 1 for better scaling
                            ),
                          ),
                        ],
                      ),
                    ),
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
