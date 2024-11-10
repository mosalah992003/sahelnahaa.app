import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true; // To toggle password visibility

  @override
  Widget build(BuildContext context) {
    // Get the screen width to make it responsive
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth > 400
        ? 380
        : screenWidth * 0.9; // Adjust width for smaller screens

    return Container(
      width: containerWidth,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color:
                  Colors.black.withOpacity(0.7), // Maintain visibility opacity
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Toggle password visibility
              });
            },
          ),
          const SizedBox(width: 195), // Adjusted spacing between icon and text
          Expanded(
            // Use Expanded to allow the text to fill the remaining space
            child: TextField(
              obscureText: _isObscured,
              decoration: InputDecoration(
                hintText: 'كلمة المرور',
                border: InputBorder.none, // Remove default border
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
