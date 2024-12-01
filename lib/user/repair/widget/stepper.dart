import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper(
      {required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.cont1,
      required this.cont2});
  final Color icon3;
  final Color icon2;
  final Color icon1;
  final Color text3;
  final Color text2;
  final Color text1;
  final Color cont2;
  final Color cont1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                IconsaxPlusBold.tick_circle,
                color: icon3,
                size: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 90,
                height: 6,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: cont2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(53.85),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                IconsaxPlusBold.tick_circle,
                color: icon2,
                size: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 90,
                height: 6,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: cont1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(53.85),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                IconsaxPlusBold.tick_circle,
                color: icon1,
                size: 35,
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التأكيد',
                style: TextStyle(
                  color: text3,
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                  letterSpacing: -0.42,
                ),
              ),
              Text(
                'تحديد الموعد ',
                style: TextStyle(
                  color: text2,
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                  letterSpacing: -0.42,
                ),
              ),
              Text(
                'المشكلة',
                style: TextStyle(
                  color: text1,
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: -0.42,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
