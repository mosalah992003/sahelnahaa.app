import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:sahelnahaa/user/profile/credit.dart';
import 'package:sahelnahaa/user/profile/vodafonecash.dart';
import 'package:sahelnahaa/user/repair/widget/button.dart';
import 'package:sahelnahaa/user/repair/widget/order_details.dart';
import 'package:sahelnahaa/user/repair/widget/stepper.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  Color icon3Color = const Color(0xFF7C8987);
  Color text3Color = const Color(0xFF7C8987);

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Orderview()),
            );
          }
        });

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            width: 100.w,
            height: 32.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.h)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60.w,
                  height: 10.h,
                  child: Image.asset(
                      "assets/shop/Order-Delivered--Streamline-Barcelona.svg.png"), // Ensure asset path is correct
                ),
                SizedBox(height: 3.h),
                Text(
                  'شكرا لك , حجزك تم بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 3.h),
                Icon(IconsaxPlusBold.tick_circle,
                    color: Colors.green, size: 6.h),
              ],
            ),
          ),
        );
      },
    );
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
            'تأكيد الطلب',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView(
          children: [
            SizedBox(height: 3.h),
            Text(
              'طريقة الدفع',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF20776B),
                fontSize: 16.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.h),
            const Credit(),
            SizedBox(height: 3.h),
            const VodafoneCash(),
            SizedBox(height: 3.h),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                decoration: ShapeDecoration(
                  color: const Color(0x7FDEE0E4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'يرجى العلم انه لن تتم محاسبتك قبل قبل إتمام المهمة من جانب الفني ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF383838),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.info,
                        color: const Color(0xff207768), size: 2.5.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h),
            const OrderDetails(),
            SizedBox(height: 3.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  icon3Color = const Color(0xFF207768);
                  text3Color = const Color(0xFF207768);
                });
                _showSuccessDialog();
              },
              child: const Button(name: 'تأكيد'),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 10.h,
        alignment: Alignment.center,
        child: const CustomStepper(
          icon1: Color(0xFF207768),
          icon2: Color(0xFF207768),
          icon3: Color(0xFF207768),
          text1: Color(0xFF207768),
          text2: Color(0xFF207768),
          text3: Color(0xFF207768),
          cont1: Color(0xFF207768),
          cont2: Color(0xFF207768),
        ),
      ),
    );
  }
}
