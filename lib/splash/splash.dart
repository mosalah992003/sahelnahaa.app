import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sahelnahaa/on%20bording/onbording1.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _skewAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _skewAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: LottieBuilder.asset(
                "assets/lottie/Animation - 1730462971575.json",
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(_scaleAnimation.value) // Scale effect
                    ..rotateZ(_skewAnimation.value), // Wobble rotation effect
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Text(
                      "سهلناها",
                      style: TextStyle(
                        color: const Color(0xff207768),
                        fontFamily: "noto",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        nextScreen: const DoorHubOnboardingScreen(),
        splashIconSize: 70.h,
        duration: 4500,
      ),
    );
  }
}
