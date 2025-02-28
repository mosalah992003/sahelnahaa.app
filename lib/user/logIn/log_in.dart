import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/email_password.dart';
import 'package:sahelnahaa/user/logIn/logwith.dart';
import 'package:sahelnahaa/user/logIn/register.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo with responsive dimensions
              Padding(
                padding: EdgeInsets.only(
                  top: 8.h,
                  left: 10.w, // 25% from the left
                  right: 10.w, // 25% from the right
                ),
                child: Image.asset(
                  "assets/shop/logo.png",
                  width: 30.w, // 35% of screen width
                  height: 22.h, // 20% of screen height
                ),
              ),
              Text(
                "سهلناها",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w900,
                  fontFamily: "noto",
                  color: Colors.white,
                  height: 1,
                ),
              ),
              SizedBox(height: 6.h),
              const EmailPasswordWidget(),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 5.w, // 5% indent
                      color: Colors.white,
                      thickness: 0.1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      'أو يمكنك التسجيل من خلال',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Noto',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      endIndent: 5.w, // 5% end indent
                      color: Colors.white,
                      thickness: .1.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logwith(
                    picture: 'assets/shop/image 31.png',
                  ),
                  SizedBox(width: 3.3.w),
                  const Logwith(
                    picture: "assets/shop/image 32.png",
                  ),
                  SizedBox(width: 3.3.w),
                  const Logwith(
                    picture: "assets/shop/image 33.png",
                  ),
                ],
              ),

              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        color: const Color(0xFFF2A941),
                        fontSize: 14.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'ليس لديك حساب؟ ',
                    style: TextStyle(
                      color: const Color(0xFFFAFAFA),
                      fontSize: 14.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
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
