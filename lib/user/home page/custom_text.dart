import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/offers/offersview.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:sahelnahaa/user/tashteba/tashteba.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CustomText extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomText({required this.name, required this.namee});
  final String name;
  final String namee;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                if (namee == "الخدمات") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RepairView()),
                  );
                } else if (namee == "تشطيبة") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tashteba()),
                  );
                } else if (namee == 'العروض ') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Offersview()),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 5.w), // Responsive padding
                child: Text(
                  name,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF20776B),
                    fontSize: 13.sp, // Responsive font size
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1), // Adjust the space dynamically
            Padding(
              padding:
                  EdgeInsets.only(right: 5.w), // Responsive padding from right
              child: Text(
                namee,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF1B2431),
                  fontSize: 15.sp, // Responsive font size
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
