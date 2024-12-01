import 'package:flutter/material.dart';

class EmergencyOrder extends StatefulWidget {
  const EmergencyOrder({super.key});

  @override
  State<EmergencyOrder> createState() => _EmergencyOrderState();
}

class _EmergencyOrderState extends State<EmergencyOrder> {
  Color _containerColor = const Color(0xFF9E9B9B); // Default color

  void _toggleColor() {
    setState(() {
      // Toggle between the default color and the active color
      _containerColor = _containerColor == const Color(0xFF9E9B9B)
          ? const Color(0xFFB74242)
          : const Color(0xFF9E9B9B);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 274,
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
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
                width: 7,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(Icons.info),
              ),
              SizedBox(
                width: 76,
              ),
              Text(
                'هل تريد الخدمة اليوم طارئة',
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
            ],
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: _toggleColor, // Change the color when tapped
          child: Container(
            width: 90,
            height: 38,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: _containerColor, // Use the current color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'طلب فوري',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFE0DEDE),
                    fontSize: 15,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                    letterSpacing: -0.45,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
