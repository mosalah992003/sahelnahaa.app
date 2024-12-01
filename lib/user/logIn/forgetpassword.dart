import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/otp.dart'; // Import the OTP page
import 'package:sahelnahaa/user/logIn/textfieldregister.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF215F56), // The specific color you requested
              Color(0xff207768), // Your original background color
            ],
            stops: [0.1, 0.3], // Adjust the gradient stop to control height
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1, // 10% horizontal padding
                vertical: screenHeight * 0.09, // 10% vertical padding
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'إعادة تعيين كلمة المرور',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: "noto",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                    "assets/images/Group.png",
                    width: screenWidth * 0.35, // 35% of screen width
                    height: screenHeight * 0.2, // 20% of screen height
                  ),
                  const SizedBox(height: 50),
                  const Textfieldregister(name: 'الإيميل'),
                  const SizedBox(height: 20),
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
                      width: screenWidth * 0.95, // 95% of screen width
                      height: screenHeight * 0.06, // 6% of screen height
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: const Color(0xffF2A941),
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
                              color: Colors.white,
                              fontSize: 20,
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
