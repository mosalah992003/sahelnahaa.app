import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/carts/product.dart';
import 'package:sahelnahaa/user/payment/payment.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  // Method to get responsive text size based on screen width
  double _getResponsiveFontSize(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    return size *
        (screenWidth /
            375); // 375 is the width of the base screen size (e.g., iPhone 8)
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
            'السلة',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: _getResponsiveFontSize(context, 22),
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 29),
            const Product(),
            const SizedBox(height: 30),
            const Product(),
            const SizedBox(height: 30),
            const Product(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1560 جنية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFFACA9A7),
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'المجموع',
                  style: TextStyle(
                    color: const Color(0xFFACA9A7),
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '220 جنية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFFACA9A7),
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  ' الخصم',
                  style: TextStyle(
                    color: const Color(0xFFACA9A7),
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مجانا',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFFACA9A7),
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'التوصيل',
                  style: TextStyle(
                    color: const Color(0xFFACA9A7),
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1340 جنية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF20776B),
                    fontSize: _getResponsiveFontSize(context, 22),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'المجموع الكلي',
                  style: TextStyle(
                    color: const Color(0xFF282828),
                    fontSize: _getResponsiveFontSize(context, 20),
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // 90% of the screen width
                height: 55,
                padding: const EdgeInsets.symmetric(vertical: 17),
                decoration: ShapeDecoration(
                  color: const Color(0xFF20776B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 15,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'إكمال الدفع',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _getResponsiveFontSize(context, 19),
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                      height: 0.05,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
