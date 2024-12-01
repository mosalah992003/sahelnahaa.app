import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Defineproblem extends StatelessWidget {
  const Defineproblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 142,
        decoration: BoxDecoration(
          color: const Color(0xFFE7E7E7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: '                          وصف المشكلة (إختياري)',
            hintStyle: TextStyle(
              color: Color(0xFF676767),
              fontSize: 16,
              fontFamily: 'noto',
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 7),
              child: Icon(
                IconsaxPlusLinear.message_2,
                color: Color(0xFF6E6C6C),
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }
}
