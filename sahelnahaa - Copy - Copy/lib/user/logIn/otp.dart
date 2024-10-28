import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/custom_otp.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
          child: Column(
            children: [
              const Text(
                'إدخل الرمز المرسل', // Fixed spacing in the text
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontFamily: "noto",
                ),
                textAlign: TextAlign.center, // Center the text alignment
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/Group 34163.png",
                width: 214,
                height: 214,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'تم إرسال الرمز إلى حسابك الجيميل',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                  letterSpacing: -0.41,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const OtpTextField(),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 235,
                height: 22,
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
                              color:
                                  Colors.white.withOpacity(0.699999988079071),
                              fontSize: 12,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w700,
                              height: 0.15,
                              letterSpacing: -0.41,
                            ),
                          ),
                          const TextSpan(
                            text: ' إعادة إرسال الرمز',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w700,
                              height: 0.11,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
