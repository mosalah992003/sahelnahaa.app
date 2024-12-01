import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/offers/offersview.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:sahelnahaa/user/tashteba/tashteba.dart';

class CustomText extends StatelessWidget {
  const CustomText({required this.name, required this.namee});
  final String name;
  final String namee;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the screen width for responsive scaling
        final double screenWidth = constraints.maxWidth;

        // Set responsive font sizes based on screen width
        double nameFontSize = screenWidth * 0.03; // Adjusting for name text
        double nameeFontSize = screenWidth * 0.043; // Adjusting for namee text

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
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05), // Responsive padding
                child: Text(
                  name,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF20776B),
                    fontSize: nameFontSize, // Responsive font size
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1), // Adjust the space dynamically
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.05), // Responsive padding from right
              child: Text(
                namee,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF1B2431),
                  fontSize: nameeFontSize, // Responsive font size
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
