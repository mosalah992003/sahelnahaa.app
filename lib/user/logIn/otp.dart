import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/custom_otp.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: Center(
        child: SingleChildScrollView(
          // Wrap Column with SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1, // 10% horizontal padding
              vertical: screenHeight * 0.12, // 12% vertical padding
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'إدخل الرمز المرسل',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontFamily: "noto",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  "assets/images/Group 34163.png",
                  width: screenWidth * 0.5, // Responsive width
                  height: screenWidth * 0.5, // Responsive height
                ),
                const SizedBox(height: 10),
                Text(
                  'تم إرسال الرمز إلى حسابك الجيميل',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    letterSpacing: -0.41,
                  ),
                ),
                const SizedBox(height: 40),
                const OtpTextField(),
                const SizedBox(height: 15),
                Container(
                  width: screenWidth * 0.6, // Responsive width
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
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
                                fontSize: 12,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                                letterSpacing: -0.41,
                              ),
                            ),
                            const TextSpan(
                              text: ' إعادة إرسال الرمز',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w800,
                                height: 1.5,
                                letterSpacing: -0.41,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
