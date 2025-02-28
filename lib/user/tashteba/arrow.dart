import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
          side: const BorderSide(width: 1, color: Color(0xFF262626)),
          borderRadius: BorderRadius.circular(69),
        ),
      ),
      child: icon,
    );
  }
}
