import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/notification/tecnotification.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Notification2 extends StatefulWidget {
  const Notification2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Notification2State createState() => _Notification2State();
}

class _Notification2State extends State<Notification2> {
  bool isMarketAlertsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Icon(
              IconsaxPlusLinear.setting_2,
              size: 2.5.h,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: double.infinity,
              height: 6.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF5D5D5D).withOpacity(.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.h),
                ),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: isMarketAlertsSelected ? 0.w : 22.h,
                    right: isMarketAlertsSelected ? 22.h : 0.w,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMarketAlertsSelected = !isMarketAlertsSelected;
                        });
                      },
                      child: Container(
                        width: 40.w,
                        height: 6.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-0.66, 0.75),
                            end: Alignment(0.66, -0.75),
                            colors: [
                              Color(0xFF2A8C7F),
                              Color(0xff207768),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.40, color: Color(0xFF2DB09E)),
                            borderRadius: BorderRadius.circular(5.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMarketAlertsSelected = true;
                                });
                              },
                              child: Text(
                                'تنبيهات السوق',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMarketAlertsSelected = false;
                                });
                              },
                              child: Text(
                                'تنبيهات الخدمات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Tecnotification(),
          ],
        ),
      ),
    );
  }
}
