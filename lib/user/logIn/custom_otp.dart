import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sahelnahaa/user/logIn/reset_password.dart';
import 'package:screen_go/extensions/responsive_nums.dart'; // Import your ResetPassword page

class OtpTextField extends StatefulWidget {
  const OtpTextField({super.key});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  final focusedBorderColor = Colors.white;
  final fillColor = Colors.white;
  final borderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // Calculate dimensions based on screen width
    final double pinWidth = 14.w; // 15% of screen width
    final double pinHeight = 6.3.h; // Maintain square shape
    final double fontSize = 20.sp; // Font size relative to pin width

    final defaultPinTheme = PinTheme(
      width: pinWidth,
      height: pinHeight,
      textStyle: TextStyle(fontSize: fontSize, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
                // Navigate to ResetPassword page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword()),
                );
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    width: 6.w, // Adjust cursor width
                    height: 2,
                    color: Colors.white,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(1.h),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(1.h),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
