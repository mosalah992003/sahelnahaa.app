import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Tecnotification extends StatefulWidget {
  const Tecnotification({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TecnotificationState createState() => _TecnotificationState();
}

class _TecnotificationState extends State<Tecnotification> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(2.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: .5, color: Color(0xFFD6D4D4)),
              borderRadius: BorderRadius.circular(2.h),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 9.w,
                            height: 4.5.h,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(),
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h),
                              Text(
                                'محمد إبراهيم ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'سباكة',
                                style: TextStyle(
                                  color: const Color(0xFF8E8E8E),
                                  fontSize: 14.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            '4.6',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF705D5D),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              height: 1.20,
                              letterSpacing: -0.27,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Icon(
                            IconsaxPlusBold.star,
                            color: Colors.yellow,
                            size: 2.5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'تم قبول طلبك ,و تم إرسال عرض من قبل مقدم الخدمة, وهو في إنتظار الرد',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 14.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    'عرض كل التفاصيل',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 13.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                if (isExpanded)
                  Column(
                    children: [
                      Text(
                        'لقد شاهدت مشكلة حضرتك و بإمكاني حلها لأنني قد مررت بمشاكل مماثلة من قبل و كان العمل عليها بالنسبة لي سهل و امتلك جميع الأدوات اللازمة و جاهز للحضور في الموعد المحدد',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF2E2E2E),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'العرض المقدم لإصلاح العطل هو : ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF252525),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            width: 25.w,
                            height: 3.5.h,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(-0.62, -0.78),
                                end: Alignment(0.62, 0.78),
                                colors: [Color(0xFF762323), Color(0xFF20776B)],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.h)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '120 _ 150 جنية',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Orderview();
                    }));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 5.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'الانتقال إلى الطلبات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
