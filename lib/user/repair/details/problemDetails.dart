// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/details/location_time.dart';
import 'package:sahelnahaa/user/repair/widget/addImage.dart';
import 'package:sahelnahaa/user/repair/widget/button.dart';
import 'package:sahelnahaa/user/repair/widget/defineProblem.dart';
import 'package:sahelnahaa/user/repair/widget/kindRepaire.dart';
import 'package:sahelnahaa/user/repair/widget/stepper.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Problemdetails extends StatelessWidget {
  const Problemdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 9.h,
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(4.h),
            bottomRight: Radius.circular(4.h),
          ),
        ),
        title: Center(
          child: Text(
            'وصف المشكلة التي تعاني منها',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
              height: 0.6,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
        child: ListView(
          children: [
            const Kindrepaire(),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              endIndent: 10.w,
              indent: 10.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            const Defineproblem(),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              endIndent: 10.w,
              indent: 10.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            const Addimage(),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationTime(),
                  ),
                );
              },
              child: const Button(
                name: 'التالي',
              ),
            ),
            SizedBox(
              height: 4.h,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 10.h,
        alignment: Alignment.center,
        child: const CustomStepper(
          icon1: Color(0xFF207768),
          icon2: Color(0xFF7C8987),
          icon3: Color(0xFF7C8987),
          text1: Color(0xFF207768),
          text2: Color(0xFF7C8987),
          text3: Color(0xFF7C8987),
          cont1: Color(0xFF207768),
          cont2: Color(0xFFF3F3F3),
        ),
      ),
    );
  }
}
