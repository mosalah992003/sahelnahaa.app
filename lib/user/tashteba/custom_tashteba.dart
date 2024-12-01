import 'package:flutter/material.dart';

class CustomTashteba extends StatelessWidget {
  const CustomTashteba({required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        width: 390,
        height: 462,
        padding: const EdgeInsets.all(24),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFFE8E8E8),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDFDFDF)),
            borderRadius: BorderRadius.circular(16),
          ),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
