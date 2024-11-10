import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sahelnahaa/user/logIn/reset_password.dart'; // Import your ResetPassword page

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
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate dimensions based on screen width
    final double pinWidth = screenWidth * 0.15; // 15% of screen width
    final double pinHeight = pinWidth; // Maintain square shape
    final double fontSize = pinWidth * 0.4; // Font size relative to pin width

    final defaultPinTheme = PinTheme(
      width: pinWidth,
      height: pinHeight,
      textStyle: TextStyle(fontSize: fontSize, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
                Navigator.push(
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
                    margin: const EdgeInsets.only(bottom: 9),
                    width: pinWidth * 0.4, // Adjust cursor width
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(10),
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
