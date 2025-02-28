import 'package:flutter/material.dart';
import 'package:sahelnahaa/SharedPreferencesHelper.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        SharedPreferencesHelper.getServiceName(),
        SharedPreferencesHelper.getTime(),
        SharedPreferencesHelper.getDate(),
        SharedPreferencesHelper.getLocation(),
      ]),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final serviceName = snapshot.data?[0] ?? 'أسم الخدمة';
        final time = snapshot.data?[1] ?? '9:00 - 11:00 صباحا';
        final date = snapshot.data?[2] ?? 'الأربعاء 12 نوفمبر , 2024';
        final location =
            snapshot.data?[3] ?? 'المنصورة شارع الترعة بجوار محل البغل';

        return SizedBox(
          // Replaced Expanded with SizedBox
          width: double.infinity,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                borderRadius: BorderRadius.circular(2.h),
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/cards/logo.png",
                          height: 7.5.w,
                          width: 3.h,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          serviceName,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF1B2431),
                            fontSize: 15.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                            height: 1.2, // Fixed height
                            letterSpacing: -0.42,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    width: 80.w,
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'التوقيت',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF777777),
                            fontSize: 14.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 1.2, // Fixed height
                            letterSpacing: -0.36,
                          ),
                        ),
                        Text(
                          'اليوم',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: const Color(0xFF777777),
                            fontSize: 14.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 1.2, // Fixed height
                            letterSpacing: -0.36,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            color: const Color(0xFF1B2431),
                            fontSize: 14.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 1.2, // Fixed height
                            letterSpacing: -0.39,
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            color: const Color(0xFF313131),
                            fontSize: 14.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 1.2, // Fixed height
                            letterSpacing: -0.39,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    width: 80.w,
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
                  SizedBox(height: 2.h),
                  Center(
                    child: Text(
                      'العنوان',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF777777),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        height: 1.2, // Fixed height
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    location,
                    style: TextStyle(
                      color: const Color(0xFF1B2431),
                      fontSize: 14.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.39,
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
