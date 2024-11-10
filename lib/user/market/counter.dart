import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomCounter extends StatefulWidget {
  final double? btnRadius;
  const CustomCounter({super.key, this.btnRadius});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _counter = 0;
  bool _isAddIconPressed = false;
  bool _isRemoveIconPressed = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isAddIconPressed = true;
      _isRemoveIconPressed = false;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _isAddIconPressed = false;
        _isRemoveIconPressed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 24,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: _decrementCounter,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _isRemoveIconPressed
                      ? const Color(0xFF207768)
                      : const Color(0xFF5E5E5E),
                  borderRadius: BorderRadius.circular(widget.btnRadius ?? 2),
                ),
                child: const Icon(
                  Icons.remove,
                  size: 13,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              _counter.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _isAddIconPressed
                      ? const Color(0xFF207768)
                      : const Color(0xFF5E5E5E),
                  borderRadius: BorderRadius.circular(widget.btnRadius ?? 2),
                ),
                child: const Icon(
                  Icons.add,
                  size: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0XFF1E1E1E),
          ),
          const BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
            inset: true,
          ),
        ],
      ),
      child: child,
    );
  }
}
