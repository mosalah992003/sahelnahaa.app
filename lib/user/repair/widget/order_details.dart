import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 238,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE5E5E5)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 23,
              ),
              const Icon(IconsaxPlusLinear.arrow_left_1),
              const SizedBox(
                width: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: Container(
                    width: 28,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE5E5E5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              const Text(
                'أسم الخدمة ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF1B2431),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.42,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/cards/logo.png",
                height: 30,
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 310,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    'التوقيت',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 12,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                      letterSpacing: -0.36,
                    ),
                  ),
                ),
                SizedBox(
                  width: 129,
                  child: Text(
                    'اليوم',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 12,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                      letterSpacing: -0.36,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                ),
                SizedBox(
                  width: 109,
                  child: Text(
                    '9:00 - 11:00  صباحا',
                    style: TextStyle(
                      color: Color(0xFF1B2431),
                      fontSize: 13,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.39,
                    ),
                  ),
                ),
                SizedBox(
                  width: 129,
                  child: Text(
                    'الأربعاء 12 نوفمبر , 2024',
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 13,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.39,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 310,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 153,
                  child: const Text(
                    'العنوان',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 12,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                      letterSpacing: -0.36,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    'المنصورة شارع الترعة بجوار محل البغل',
                    style: TextStyle(
                      color: Color(0xFF1B2431),
                      fontSize: 13,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.39,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
