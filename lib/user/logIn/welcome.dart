import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.6; // 60% of screen width
    final double imageHeight = imageWidth; // Maintain square aspect ratio
    final double titleFontSize =
        screenSize.width * 0.075; // 7.5% of screen width
    final double subtitleFontSize =
        screenSize.width * 0.04; // 4% of screen width

    return Scaffold(
      body: Container(
        height: double.infinity,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.03), // 20% of screen height
                child: Image.asset(
                  "assets/images/Welcome (2).png",
                  width: imageWidth * 1.2, // Increased width by 20%
                  height: imageHeight * 1.2, // Increased height by 20%
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'تم إنشاء حسابك بنجاح',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'سيتم تحويلك للصفحة الرئيسيه خلال ثوان',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: subtitleFontSize,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
