import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class PasswordFieldConfirm extends StatefulWidget {
  const PasswordFieldConfirm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordFieldConfirm> {
  bool _isObscured = true; // To toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              _isObscured ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
              color: Colors.black.withOpacity(0.6),
              size: 2.6.h, // Maintain visibility opacity
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Toggle password visibility
              });
            },
          ),
          Expanded(
            // Use Expanded to allow the text to fill the remaining space
            child: TextField(
              obscureText: _isObscured,
              textDirection: TextDirection.rtl, // Set text direction to RTL
              textAlign: TextAlign.right, // Align text and hint to the right
              decoration: InputDecoration(
                hintText: 'تأكيد كلمة المرور',
                border: InputBorder.none, // Remove default border
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 15.sp,
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
