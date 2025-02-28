import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/offers/offersview.dart';
import 'package:sahelnahaa/user/profile/credit.dart';
import 'package:sahelnahaa/user/profile/vodafonecash.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  // Helper function to scale width
  double scaleWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width * (width / 390);
  }

  // Helper function to scale height
  double scaleHeight(BuildContext context, double height) {
    return MediaQuery.of(context).size.height * (height / 844);
  }

  // Helper function to scale font size
  double scaleFont(BuildContext context, double fontSize) {
    return MediaQuery.of(context).size.width * (fontSize / 390);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        title: Center(
          child: Text(
            'طرق الدفع',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 1.4.h),
              Text(
                'طرق دفع بنكية',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Credit(),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'طرق دفع اخرى',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.5.h),
              const VodafoneCash(),
              SizedBox(height: 4.h),
              Material(
                elevation: 1.5,
                borderRadius: BorderRadius.circular(2.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Offersview()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(IconsaxPlusLinear.arrow_left_1),
                          Row(
                            children: [
                              Text(
                                'العروض',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: scaleFont(context, 16),
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                IconsaxPlusLinear.ticket_discount,
                                size: 2.5.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Material(
                elevation: 1.5,
                borderRadius: BorderRadius.circular(2.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RepairView()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(IconsaxPlusLinear.arrow_left_1),
                          Row(
                            children: [
                              Text(
                                'الخدمات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: scaleFont(context, 16),
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                LineAwesomeIcons.wrench_solid,
                                size: 2.5.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
