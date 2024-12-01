import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x7FDEE0E4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 285,
            child: const Text(
              'إلغاء مجاني إلى قبل وصول العامل ب 12 ساعة',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF23334A),
                fontSize: 12,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0.12,
                letterSpacing: -0.36,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.info)
        ],
      ),
    );
  }
}
