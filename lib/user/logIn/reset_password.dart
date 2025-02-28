import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/j.dart';
import 'package:sahelnahaa/user/logIn/password.dart';
import 'package:sahelnahaa/user/logIn/success.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
          // Wrap Column in SingleChildScrollView
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // This allows the Column to take up only the space it needs
                children: [
                  Text(
                    'تغيير كلمة المرور الخاص بك',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Use responsive width for PasswordField
                  const PasswordField(),
                  SizedBox(height: 2.h),
                  // Use responsive width for PasswordFieldConfirm
                  const PasswordFieldConfirm(),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const Success();
                      }));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 6.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xffF2A941),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'تأكيد التغيير',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                            height: 1, // Adjusted for better line height
                          ),
                        ),
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
