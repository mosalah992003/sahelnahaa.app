import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({required this.name, required this.name2});
  final String name;
  final String name2;

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Color _containerColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _containerColor = const Color(0xFF207768);
        });
      },
      child: Container(
        width: 390,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 120.50, vertical: 15),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: _containerColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.90, color: Colors.grey.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Color(0xFF1B2431),
                    fontSize: 13,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: -0.39,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  widget.name2,
                  style: const TextStyle(
                    color: Color(0xFF1B2431),
                    fontSize: 13,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: -0.39,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
