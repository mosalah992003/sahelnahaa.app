import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/otp.dart'; // Import the OTP page
import 'package:sahelnahaa/user/logIn/textfieldregister.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: Center(
        // Center the column vertically and horizontally
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 40, vertical: 120), // Set horizontal padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Center vertically
            children: [
              const Text(
                'إعادة تعيين كلمة المرور', // Fixed spacing in the text
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontFamily: "noto",
                ),
                textAlign: TextAlign.center, // Center the text alignment
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/images/Group.png",
                width: 132,
                height: 142,
              ),
              const SizedBox(height: 40),
              const Textfieldregister(name: 'الأيميل'),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to the OTP page when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const Otp(), // Replace with your OTP page
                    ),
                  );
                },
                child: Container(
                  width: 380,
                  height: 56,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'إرسال الرمز',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                          height: 0.07,
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
    );
  }
}
