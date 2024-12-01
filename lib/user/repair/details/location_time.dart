import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/details/pay.dart';
import 'package:sahelnahaa/user/repair/widget/button.dart';
import 'package:sahelnahaa/user/repair/widget/date.dart';
import 'package:sahelnahaa/user/repair/widget/emergency_order.dart';
import 'package:sahelnahaa/user/repair/widget/location.dart';
import 'package:sahelnahaa/user/repair/widget/reset.dart';
import 'package:sahelnahaa/user/repair/widget/stepper.dart';

class LocationTime extends StatefulWidget {
  const LocationTime({super.key});

  @override
  State<LocationTime> createState() => _LocationTimeState();
}

class _LocationTimeState extends State<LocationTime> {
  int _selectedIndex =
      -1; // Tracks the selected container (-1 means none selected)

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
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
            'أختيار التاريخ و العنوان',
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            EmergencyOrder(),
            // Example EmergencyOrder() widget
            const SizedBox(height: 25),
            const SizedBox(
              width: 386,
              child: Text(
                'متى تريد تلقى الخدمة ؟',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF20776B),
                  fontSize: 15,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                  letterSpacing: -0.45,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              height: 113,
              color: Colors.white,
              child: TimelineCalendar(), // Replace with your TimelineCalendar
            ),
            const SizedBox(height: 18),
            const SizedBox(
              width: 390,
              child: Text(
                'أختر موعدك المناسب ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF20776B),
                  fontSize: 15,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                  letterSpacing: -0.45,
                ),
              ),
            ),
            const SizedBox(height: 18),
            _buildTimeOption(0, 'صباحا', '11_9'),
            const SizedBox(height: 8),
            _buildTimeOption(1, 'بعد الظهر', '3_12'),
            const SizedBox(height: 8),
            _buildTimeOption(2, 'مساءا', '7_3'),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              width: 386,
              child: Text(
                ' : حدد عنوانك',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF20776B),
                  fontSize: 15,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                  letterSpacing: -0.45,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Location(),
            SizedBox(
              height: 21,
            ),
            Reset(),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pay(),
                  ),
                );
              },
              child: Button(
                name: 'التالي',
              ),
            ),
            SizedBox(
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
            cont1: Color(0xFF207768),
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

  Widget _buildTimeOption(int index, String name, String name2) {
    return GestureDetector(
      onTap: () => _onSelect(index),
      child: Container(
        width: 390,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 120.50, vertical: 15),
        decoration: ShapeDecoration(
          color:
              _selectedIndex == index ? const Color(0xFF207768) : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.90,
              color: Colors.grey.withOpacity(0.6),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: _selectedIndex == index
                    ? Colors.white
                    : const Color(0xFF1B2431),
                fontSize: 13,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: -0.39,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              name2,
              style: TextStyle(
                color: _selectedIndex == index
                    ? Colors.white
                    : const Color(0xFF1B2431),
                fontSize: 13,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: -0.39,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
