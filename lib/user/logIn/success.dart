import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/log_in.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Success extends StatelessWidget {
  const Success({super.key});

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
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center column vertically
              children: [
                Image.asset(
                  "assets/images/User-Secure--Streamline-Ux.png.png",
                  width: 60.w,
                  height: 30.h,
                  fit: BoxFit
                      .cover, // Ensure the image covers the given dimensions
                ),
                SizedBox(height: 4.h),
                Text(
                  'تم إعاده تعيين كلمة المرور بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp, // Responsive title font size
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
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
                      // Center the text within the button
                      child: Text(
                        'متابعة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp, // Responsive button font size
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                          height:
                              1, // Adjust line height for better readability
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
    );
  }
}
