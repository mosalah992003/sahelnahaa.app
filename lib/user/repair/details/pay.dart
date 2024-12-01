import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:sahelnahaa/user/profile/visa_container.dart';
import 'package:sahelnahaa/user/repair/widget/button.dart';
import 'package:sahelnahaa/user/repair/widget/kind_payment.dart';
import 'package:sahelnahaa/user/repair/widget/order_details.dart';
import 'package:sahelnahaa/user/repair/widget/stepper.dart';
import 'package:sahelnahaa/user/repair/widget/visa_container.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  Color icon3Color = const Color(0xFF7C8987);
  Color text3Color = const Color(0xFF7C8987);

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed
      builder: (BuildContext context) {
        // Automatically navigate after 2 seconds
        Future.delayed(const Duration(seconds: 2), () {
          // First, close the dialog
          Navigator.of(context).pop();

          // Then navigate to OrderView page
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                const Orderview(), // Replace with your actual OrderView page
          ));
        });

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Container(
            width: 390,
            height: 294,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 132,
                  height: 132,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    "assets/shop/Order-Delivered--Streamline-Barcelona.svg.png",
                    width: 132,
                    height: 132,
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'شكرا لك , حجزك تم بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.60,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    IconsaxPlusBold.tick_circle,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
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
            'تأكيد الطلب',
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'طريقة الدفع',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF20776B),
                fontSize: 17,
                fontFamily: 'noto',
                fontWeight: FontWeight.w500,
                height: 0.07,
                letterSpacing: -0.51,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const KindPayment(),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                const SizedBox(width: 213),
                Container(
                  width: 25,
                  height: 25,
                  decoration: ShapeDecoration(
                    color: Colors.lightBlue.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(
                    IconsaxPlusLinear.add,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'أضافه طريقه اخرى ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF606060),
                    fontSize: 14,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 390,
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0x7FDEE0E4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 278,
                    child: Text(
                      'يرجى العلم انه لن تتم محاسبتك قبل قبل إتمام المهمة من جانب الفني ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF383838),
                        fontSize: 12,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 20,
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: const Icon(
                      Icons.info,
                      color: Color(0xff207768),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'تفاصيل الطلب',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF20776B),
                fontSize: 17,
                fontFamily: 'noto',
                fontWeight: FontWeight.w500,
                height: 0.07,
                letterSpacing: -0.51,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const OrderDetails(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  icon3Color = const Color(0xFF207768);
                  text3Color = const Color(0xFF207768);
                });
                _showSuccessDialog();
              },
              child: const Button(
                name: 'تأكيد',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 95,
        alignment: Alignment.center,
        child: CustomStepper(
          cont1: const Color(0xFF207768),
          cont2: const Color(0xFF207768),
          icon1: const Color(0xff207768),
          icon2: const Color(0xFF207768),
          icon3: icon3Color,
          text3: text3Color,
          text2: const Color(0xFF207768),
          text1: const Color(0xff207768),
        ),
      ),
    );
  }
}
