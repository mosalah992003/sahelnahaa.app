import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/custom_repair.dart';

class RepairView extends StatelessWidget {
  const RepairView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF9F9F9),
        title: const Center(
          child: Text(
            'خدماتي',
            style: TextStyle(
              color: Color(0xFF1B2431),
              fontSize: 22,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: CustomRepair(),
    );
  }
}
