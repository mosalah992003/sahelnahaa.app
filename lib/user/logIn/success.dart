import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/log_in.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Set consistent sizes based on screen dimensions
    final double paddingHorizontal =
        screenWidth * 0.1; // 10% of screen width for horizontal padding
    final double paddingVertical =
        screenHeight * 0.15; // 15% of screen height for vertical padding
    final double imageSize =
        screenWidth > 400 ? 260 : screenWidth * 0.65; // Scale image size
    final double buttonWidth =
        screenWidth > 400 ? 380 : screenWidth * 0.9; // Responsive button width
    final double buttonHeight = 56; // Fixed button height

    // Responsive font size calculation
    final double titleFontSize =
        screenWidth * 0.075; // 7.5% of screen width for title font size
    final double buttonFontSize =
        screenWidth * 0.05; // 5% of screen width for button font size

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
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal, vertical: paddingVertical),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center column vertically
              children: [
                Text(
                  'تم إعاده تعيين كلمة المرور بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize, // Responsive title font size
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 40),
                Image.asset(
                  "assets/images/User-Secure--Streamline-Ux.png.png",
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit
                      .cover, // Ensure the image covers the given dimensions
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      color: const Color(0xffF2A941),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      // Center the text within the button
                      child: Text(
                        'متابعة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              buttonFontSize, // Responsive button font size
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
