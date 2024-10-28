import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF9F9F9),
          title: const Center(
            child: Text(
              'السلة',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF1B2431),
                fontSize: 22,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}
