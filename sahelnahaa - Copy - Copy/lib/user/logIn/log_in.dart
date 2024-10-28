import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/email_password.dart';
import 'package:sahelnahaa/user/logIn/logwith.dart';
import 'package:sahelnahaa/user/logIn/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: SingleChildScrollView(
        // Add this widget
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 140, right: 140),
              child: Image.asset(
                "assets/images/Logo.png",
                width: 134,
                height: 110,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "سهلناها",
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  fontFamily: "noto",
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            const EmailPasswordWidget(),
            const SizedBox(height: 10),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 20,
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'أو',
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
                    endIndent: 20,
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Logwith(
              name: 'المتابعة بإستخدام حساب جوجل',
              picture: 'assets/images/Google1.webp',
            ),
            const SizedBox(height: 10),
            const Logwith(
              name: "المتابعة بإستخدام حساب فيسبوك",
              picture: "assets/images/face.jpg",
            ),
            const SizedBox(height: 10),
            const Logwith(
              name: "المتابعة بإستخدام حساب أيفون",
              picture: "assets/images/apple1.png",
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: const Text(
                    'إنشاء حساب',
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
                    'ليس لديك حساب؟ ',
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
    );
  }
}
