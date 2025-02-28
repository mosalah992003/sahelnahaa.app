import 'package:flutter/material.dart';
import 'package:sahelnahaa/SharedPreferencesHelper.dart';
import 'package:sahelnahaa/user/repair/details/pay.dart';
import 'package:sahelnahaa/user/repair/widget/button.dart';
import 'package:sahelnahaa/user/repair/widget/date.dart';
import 'package:sahelnahaa/user/repair/widget/emergency_order.dart';
import 'package:sahelnahaa/user/repair/widget/location.dart';
import 'package:sahelnahaa/user/repair/widget/reset.dart';
import 'package:sahelnahaa/user/repair/widget/stepper.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class LocationTime extends StatefulWidget {
  const LocationTime({super.key});

  @override
  State<LocationTime> createState() => _LocationTimeState();
}

class _LocationTimeState extends State<LocationTime> {
  int _selectedIndex =
      -1; // Tracks the selected container (-1 means none selected)

  void _onSelect(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    String time = '';
    switch (index) {
      case 0:
        time = '9:00 - 11:00 صباحا';
        break;
      case 1:
        time = '12:00 - 3:00 بعد الظهر';
        break;
      case 2:
        time = '3:00 - 7:00 مساءا';
        break;
    }

    try {
      await SharedPreferencesHelper.saveTime(time);
    } catch (e) {
      debugPrint("Error saving time: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
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
            'أختيار التاريخ و العنوان',
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
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView(
          children: [
            SizedBox(height: 2.5.h),
            const EmergencyOrder(),
            SizedBox(height: 2.5.h),
            Text(
              'متى تريد تلقى الخدمة ؟',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF20776B),
                fontSize: 15.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
                height: 0.08,
                letterSpacing: -0.45,
              ),
            ),
            SizedBox(height: 2.h),
            const TimelineCalendar(),
            SizedBox(height: 2.h),
            Text(
              'أختر موعدك المناسب ',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF20776B),
                fontSize: 15.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
                height: 0.08,
                letterSpacing: -0.45,
              ),
            ),
            SizedBox(height: 2.h),
            _buildTimeOption(0, 'صباحا', '11_9'),
            const SizedBox(height: 8),
            _buildTimeOption(1, 'بعد الظهر', '3_12'),
            const SizedBox(height: 8),
            _buildTimeOption(2, 'مساءا', '7_3'),
            SizedBox(height: 2.h),
            Text(
              ' : حدد عنوانك',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF20776B),
                fontSize: 15.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
                height: 0.08,
                letterSpacing: -0.45,
              ),
            ),
            SizedBox(height: 2.h),
            const Location(),
            SizedBox(height: 3.h),
            const Reset(),
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pay()),
                );
              },
              child: const Button(name: 'التالي'),
            ),
            SizedBox(height: 3.h),
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
          icon2: Color(0xFF207768),
          icon3: Color(0xFF7C8987),
          text3: Color(0xFF7C8987),
          text2: Color(0xFF207768),
          text1: Color(0xff207768),
        ),
      ),
    );
  }

  Widget _buildTimeOption(int index, String name, String name2) {
    return GestureDetector(
      onTap: () => _onSelect(index),
      child: Container(
        width: double.infinity,
        height: 5.5.h,
        decoration: ShapeDecoration(
          color:
              _selectedIndex == index ? const Color(0xFF207768) : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.90,
              color: Colors.grey.withOpacity(0.6),
            ),
            borderRadius: BorderRadius.circular(1.h),
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
                fontSize: 14.5.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: -0.39,
              ),
            ),
            SizedBox(width: 1.w),
            Text(
              name2,
              style: TextStyle(
                color: _selectedIndex == index
                    ? Colors.white
                    : const Color(0xFF1B2431),
                fontSize: 14.5.sp,
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
