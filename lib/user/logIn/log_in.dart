import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/email_password.dart';
import 'package:sahelnahaa/user/logIn/logwith.dart';
import 'package:sahelnahaa/user/logIn/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo with responsive dimensions
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.08, // 15% from the top
                  left: screenWidth * 0.25, // 25% from the left
                  right: screenWidth * 0.25, // 25% from the right
                ),
                child: Image.asset(
                  "assets/shop/logo.png",
                  width: screenWidth * 0.35, // 35% of screen width
                  height: screenHeight * 0.2, // 20% of screen height
                ),
              ),
              const Text(
                "سهلناها",
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  fontFamily: "noto",
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const EmailPasswordWidget(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: screenWidth * 0.05, // 5% indent
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'أو يمكنك التسجيل من خلال',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Noto',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      endIndent: screenWidth * 0.05, // 5% end indent
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logwith(
                    picture: 'assets/shop/image 31.png',
                  ),
                  SizedBox(width: 15),
                  Logwith(
                    picture: "assets/shop/image 32.png",
                  ),
                  SizedBox(width: 15),
                  Logwith(
                    picture: "assets/shop/image 33.png",
                  ),
                ],
              ),

              const SizedBox(height: 25),
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
                    child: const Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        color: Color(0xFFF2A941),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'ليس لديك حساب؟ ',
                    style: TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 14,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
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
