import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/repair/details/location_time.dart';
import 'package:sahelnahaa/user/repair/widget/addImage.dart';
import 'package:sahelnahaa/user/repair/widget/button.dart';
import 'package:sahelnahaa/user/repair/widget/customCheckBox.dart';
import 'package:sahelnahaa/user/repair/widget/defineProblem.dart';
import 'package:sahelnahaa/user/repair/widget/kindRepaire.dart';
import 'package:sahelnahaa/user/repair/widget/stepper.dart';

class Problemdetails extends StatelessWidget {
  const Problemdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        title: const Center(
          child: Text(
            'وصف المشكلة التي تعاني منها',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
              height: 0.6,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ListView(
          children: [
            const Kindrepaire(),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              endIndent: 30,
              indent: 30,
            ),
            const SizedBox(
              height: 16,
            ),
            const Defineproblem(),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              endIndent: 30,
              indent: 30,
            ),
            const SizedBox(
              height: 16,
            ),
            const Addimage(),
            const SizedBox(
              height: 20,
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
              child: Button(
                name: 'التالي',
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          height: 95,
          alignment: Alignment.center,
          child: const CustomStepper(
            cont1: Color(0xFFF3F3F3),
            cont2: Color(0xFFF3F3F3),
            icon1: Color(0xff207768),
            icon2: Color(0xFF7C8987),
            icon3: Color(0xFF7C8987),
            text3: Color(0xFF7C8987),
            text2: Color(0xFF7C8987),
            text1: Color(0xff207768),
          )),
    );
  }
}
