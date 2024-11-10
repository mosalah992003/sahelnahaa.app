import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/j.dart';
import 'package:sahelnahaa/user/logIn/log_in.dart';
import 'package:sahelnahaa/user/logIn/password.dart';
import 'package:sahelnahaa/user/logIn/register_otp.dart';
import 'package:sahelnahaa/user/logIn/textfieldregister.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final double paddingValue =
        screenSize.width * 0.05; // 5% padding for responsiveness
    final double containerWidth =
        screenSize.width * 0.95; // 95% of screen width
    final double buttonHeight = screenSize.height * 0.07; // 7% of screen height

    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingValue),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height *
                        0.1), // Adjust top padding based on screen height
                child: Image.asset(
                  "assets/shop/logo.png",
                  width: screenSize.width * 0.25, // 25% of screen width
                  height: screenSize.height * 0.11, // 15% of screen height
                ),
              ),
              const SizedBox(height: 40),
              const Textfieldregister(name: 'الإسم الأول'),
              const SizedBox(height: 10),
              const Textfieldregister(name: 'الإسم الثانى'),
              const SizedBox(height: 10),
              const Textfieldregister(name: 'الإيميل'),
              const SizedBox(height: 10),
              const Textfieldregister(name: 'رقم الهاتف'),
              const SizedBox(height: 10),
              const Textfieldregister(name: 'العنوان'),
              const SizedBox(height: 10),
              const PasswordField(),
              const SizedBox(height: 10),
              const PasswordFieldConfirm(),
              const SizedBox(height: 30),
              GestureDetector(
                // Wrap the container with GestureDetector
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterOtp()),
                  );
                },
                child: Container(
                  width: containerWidth,
                  height: buttonHeight * 0.9, // Decreased height by 20%
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: const Color(0xffF2A941),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height:
                            1, // Use a unit height for better responsiveness
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Color(0xFFF2A941),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Center(
                    child: Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(
                        color: Color(0xFFFAFAFA),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
