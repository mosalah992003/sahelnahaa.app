import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:sahelnahaa/user/tashteba/tashteba.dart';

class CustomText extends StatelessWidget {
  const CustomText({required this.name, required this.namee});
  final String name;
  final String namee;

  @override
  Widget build(BuildContext context) {
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
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              name,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF20776B),
                fontSize: 12,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        const SizedBox(width: 250),
        Text(
          namee,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF1B2431),
            fontSize: 18,
            fontFamily: 'noto',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
