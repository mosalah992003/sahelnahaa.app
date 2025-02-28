import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/log_in.dart';
import 'package:screen_go/extensions/responsive_nums.dart'; // Ensure the LoginScreen is imported

// ignore: use_key_in_widget_constructors
class JoinUs extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  bool isSpecialistSelected = false;
  bool isUserSelected = false;

  void toggleCardSelection(int cardIndex) {
    setState(() {
      if (cardIndex == 1) {
        isSpecialistSelected = !isSpecialistSelected;
        isUserSelected = false;
      } else if (cardIndex == 2) {
        isUserSelected = !isUserSelected;
        isSpecialistSelected = false;
      }
    });
  }

  void onProceed() {
    // Proceed only if the 'مستخدم' card is selected
    if (isUserSelected) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var tween = Tween<double>(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var rotationAnimation = animation.drive(tween);

            return RotationTransition(
              turns: rotationAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(
              milliseconds: 600), // Adjust the duration as needed
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xff077068),
          content: Center(
            child: Text(
              'يرجى اختيار نوع الحساب أولاً!',
              style: TextStyle(
                  fontFamily: "noto",
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.h),
                ),
              ),
              child: Stack(children: [
                Positioned(
                  left: -8.w,
                  right: -8.w,
                  top: -20.h,
                  child: Container(
                    width: double.infinity,
                    height: 48.h,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF247A6E),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.w,
                  right: 10.w,
                  top: 11.h,
                  child: Text(
                    'انضم إلينا ک',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  left: 18.w,
                  right: 18.w,
                  top: 30.h,
                  child: GestureDetector(
                    onTap: () => toggleCardSelection(1),
                    child: Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: isSpecialistSelected
                            ? const Color(0xFF207768)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 1.4.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'فني',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isSpecialistSelected
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                                fontSize: 17.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w600,
                                height: 0.9,
                              ),
                            ),
                          ),
                          Container(
                            width: 40.w,
                            height: 25.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Engineer-1--Streamline-Ux.png.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 18.w,
                  right: 18.w,
                  top: 60.h,
                  child: GestureDetector(
                    onTap: () => toggleCardSelection(2),
                    child: Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: isUserSelected
                            ? const Color(0xFF207768)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 1.4.h,
                          ),
                          Text(
                            'مستخدم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isUserSelected
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.7),
                              fontSize: 17.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w600,
                              height: 0.9,
                            ),
                          ),
                          Container(
                            width: 40.w,
                            height: 25.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Avatar-1--Streamline-Ux.png (1).png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 5.w,
                  right: 5.w,
                  top: 91.h,
                  child: GestureDetector(
                    onTap: onProceed,
                    child: Container(
                      width: double.infinity,
                      height: 6.h,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: isSpecialistSelected || isUserSelected
                            ? const Color(0xFF207768)
                            : Colors.grey, // Grey if no card is selected
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'تقدم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.bold,
                              height: 0.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
