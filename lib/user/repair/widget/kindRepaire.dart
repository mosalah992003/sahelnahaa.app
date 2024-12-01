import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/widget/customCheckBox.dart';

class Kindrepaire extends StatelessWidget {
  const Kindrepaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 396,
      decoration: ShapeDecoration(
        color: const Color(0xFFE7E7E7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 280,
              ),
              Text(
                'نوع المهمة',
                style: TextStyle(
                  color: Color(0xFF20776B),
                  fontSize: 16,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: -0.48,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 159,
              ),
              Text(
                'تغيير خلاط مطبخ أو حمام',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              CustomCheckbox(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 175,
              ),
              Text(
                'تسريب مياه من الحوض',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              CustomCheckbox(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 240,
              ),
              Text(
                'أعطال سخان',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              CustomCheckbox(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 167,
              ),
              Text(
                'تغيير دش و تصليح بانيو',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              CustomCheckbox(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 130,
              ),
              Text(
                'فك وتغيير وتصليح فلتر المياه',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              CustomCheckbox(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 287,
              ),
              Text(
                'أخرى',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              CustomCheckbox(),
            ],
          )
        ],
      ),
    );
  }
}
