import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Arrow extends StatelessWidget {
  const Arrow({required this.color, required this.icon});
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF262626)),
          borderRadius: BorderRadius.circular(69),
        ),
      ),
      child: icon,
    );
  }
}
