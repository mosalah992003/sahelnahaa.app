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
    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110, left: 155, right: 140),
                child: Image.asset(
                  "assets/images/Logo.png",
                  width: 98,
                  height: 78,
                ),
              ),
              const SizedBox(height: 40),
              Textfieldregister(name: 'الأسم كامل '),
              const SizedBox(height: 10),
              Textfieldregister(name: 'الأيميل'),
              const SizedBox(height: 10),
              Textfieldregister(name: 'رقم الهاتف'),
              const SizedBox(height: 10),
              Textfieldregister(name: 'العنوان'),
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
                        builder: (context) =>
                            const RegisterOtp()), // Navigate to OtpRegister
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'إنشاء حساب',
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Center(
                    child: Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
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
