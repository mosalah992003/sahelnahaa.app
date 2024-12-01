import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 144,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                IconsaxPlusBold.tick_circle,
                color: Color(0xff207768),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 7, left: 130),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 110, bottom: 4),
                      child: Text(
                        'المنزل',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      ' ٨ شارع احمد كامل الدقهليه',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.39,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 120, top: 4),
                      child: Text(
                        'مصر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.39,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text(
                        'تعديل العنوان',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF20776B),
                          fontSize: 16,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.48,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  "assets/cards/logo.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
