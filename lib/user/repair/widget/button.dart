import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 44,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: const Color(0xFF8A8A8A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),
        ],
      ),
    );
  }
}
