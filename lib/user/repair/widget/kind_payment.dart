import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/widget/visa_container.dart';

class KindPayment extends StatelessWidget {
  const KindPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 195,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF5F5F5)),
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 33,
          ),
          VisaContainerRepaire(
            image: "assets/images/Group 34249.png",
            name: "Master card",
            name2: ' 9581 **** **** **** ',
          ),
          SizedBox(
            height: 12,
          ),
          VisaContainerRepaire(
            image: "assets/shop/ic_baseline-discount.png",
            name: 'الدفع كاش',
            name2: '                                      ',
          ),
        ],
      ),
    );
  }
}
