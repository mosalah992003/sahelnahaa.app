import 'package:flutter/material.dart';
import 'package:sahelnahaa/SharedPreferencesHelper.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Time extends StatefulWidget {
  const Time({
    super.key,
    required this.name,
    required this.name2,
    this.onTap,
    this.initialColor = Colors.white,
    this.selectedColor = const Color(0xFF207768),
  });

  final String name;
  final String name2;
  final VoidCallback? onTap;
  final Color initialColor;
  final Color selectedColor;

  @override
  // ignore: library_private_types_in_public_api
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late Color _containerColor;

  @override
  void initState() {
    super.initState();
    _containerColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Ensure text flows from right to left
      child: GestureDetector(
        onTap: () {
          setState(() {
            _containerColor = widget.selectedColor;
          });
          widget.onTap?.call(); // Trigger the optional onTap callback
          SharedPreferencesHelper.saveDate(widget.name2);
        },
        child: Container(
          width: 90.w, // Adjusted for better responsiveness
          height: 80.h, // Adjusted for better responsiveness
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: _containerColor,
            border: Border.all(
              width: 0.90,
              color: Colors.grey.withOpacity(0.6),
            ),
            borderRadius: BorderRadius.circular(10), // Smoother border radius
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true, // Scroll from right to left
            child: Row(
              textDirection: TextDirection.rtl, // Align text to the right
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: const Color(0xFF1B2431),
                    fontSize: 14.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.39,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  widget.name2,
                  style: TextStyle(
                    color: const Color(0xFF1B2431),
                    fontSize: 14.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.39,
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
