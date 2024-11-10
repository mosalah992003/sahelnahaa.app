import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/j.dart';
import 'package:sahelnahaa/user/logIn/password.dart';
import 'package:sahelnahaa/user/logIn/success.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width to make it responsive
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth > 400
        ? 380
        : screenWidth * 0.9; // Responsive width adjustment

    return Scaffold(
      backgroundColor: const Color(0xff207768),
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // This allows the Column to take up only the space it needs
              children: [
                const Text(
                  'تغيير كلمة المرور الخاص بك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 80),
                // Use responsive width for PasswordField
                SizedBox(
                  width: containerWidth,
                  child: const PasswordField(),
                ),
                const SizedBox(height: 20),
                // Use responsive width for PasswordFieldConfirm
                SizedBox(
                  width: containerWidth,
                  child: const PasswordFieldConfirm(),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Success();
                    }));
                  },
                  child: Container(
                    width: containerWidth,
                    height: 56,
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      color: const Color(0xffF2A941),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'تأكيد التغيير',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
    );
  }
}
