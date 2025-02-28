import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Textfieldregister extends StatelessWidget {
  // ignore: use_super_parameters
  const Textfieldregister({required this.name, Key? key}) : super(key: key);

  final String name;

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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.right, // Align text to the right
              textDirection:
                  TextDirection.rtl, // Set text direction to right-to-left
              decoration: InputDecoration(
                hintText: name, // Use the name as hint text
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 15.sp, // Screen go responsive hint text font size
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none, // Remove the default border
              ),
            ),
          ),
        ],
      ),
    );
  }
}
