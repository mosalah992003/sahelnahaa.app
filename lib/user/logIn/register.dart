import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/j.dart';
import 'package:sahelnahaa/user/logIn/password.dart';
import 'package:sahelnahaa/user/logIn/register_otp.dart';
import 'package:sahelnahaa/user/logIn/textfieldregister.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.h), // Adjust top padding based on screen height
                  child: Image.asset(
                    "assets/shop/logo.png",
                    width: 30.w, // 25% of screen width
                    height: 10.h, // 15% of screen height
                  ),
                ),
                SizedBox(height: 7.h),
                const Textfieldregister(name: 'الإسم الأول'),
                SizedBox(height: 1.5.h),
                const Textfieldregister(name: 'الإسم الثانى'),
                SizedBox(height: 1.5.h),
                const Textfieldregister(name: 'الإيميل'),
                SizedBox(height: 1.5.h),
                const Textfieldregister(name: 'رقم الهاتف'),
                SizedBox(height: 1.5.h),
                const Textfieldregister(name: 'العنوان'),
                SizedBox(height: 1.5.h),
                const PasswordField(),
                SizedBox(height: 1.5.h),
                const PasswordFieldConfirm(),
                SizedBox(height: 3.h),
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
                    width: double.infinity,
                    height: 6.h, // Decreased height by 20%
                    decoration: ShapeDecoration(
                      color: const Color(0xffF2A941),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                          height:
                              1, // Use a unit height for better responsiveness
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: const Color(0xFFF2A941),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Center(
                      child: Text(
                        'لديك حساب بالفعل؟',
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 13.sp,
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
      ),
    );
  }
}
