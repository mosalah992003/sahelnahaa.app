import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/logIn/success.dart';
import 'package:sahelnahaa/user/logIn/textfieldregister.dart';
import 'package:sahelnahaa/user/payment/success.dart';
import 'package:sahelnahaa/user/payment/textfieldregister.dart';
import 'package:sahelnahaa/user/profile/visa_container.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xfff9f9f9),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'الدفع',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1B2431),
              fontSize: 20,
              fontFamily: 'noto',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.60,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: 430,
            height: 46,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Color(0xFFEBE9E9)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                    color: Color(0xFF6B6B6B),
                    fontSize: 16,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              width: 390,
              height: 382,
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: -2.0,
                    blurRadius: 4.0,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 27, left: 250),
                    child: Text(
                      'الأسم كامل * ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Textfield(
                    name: 'الأسم كامل',
                  ),
                  Divider(
                    endIndent: 15,
                    indent: 25,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27, left: 250),
                    child: Text(
                      'رقم الهاتف*',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Textfield(
                    name: 'رقم الهاتف',
                  ),
                  Divider(
                    endIndent: 15,
                    indent: 25,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27, left: 210),
                    child: Text(
                      'العنوان بالتفصيل *',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Textfield(
                    name: 'العنوان بالتفصيل',
                  ),
                  Divider(
                    endIndent: 15,
                    indent: 25,
                    thickness: 2,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 430,
            height: 46,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Color(0xFFEAE9E9)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'طريقة الدفع',
                  style: TextStyle(
                    color: Color(0xFF6B6B6B),
                    fontSize: 16,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 390,
                height: 430,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    const VisaContainer(
                      image: "assets/images/logos_visa.png",
                      name: "Visa Bank",
                    ),
                    SizedBox(height: 10),
                    const VisaContainer(
                      image: "assets/images/Group 34249.png",
                      name: "Master card",
                    ),
                    SizedBox(height: 10),
                    const VisaContainer(
                      image: "assets/images/image 38.png",
                      name: "Telda Card",
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/Gold coins and banknotes 3d cartoon style icon 1.png",
                          width: 65,
                          height: 65,
                        ),
                        Image.asset(
                          "assets/images/image 5.png",
                          width: 65,
                          height: 65,
                        ),
                        Image.asset(
                          "assets/images/image 7.png",
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'كاش عند الأستلام',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 13,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'فودافون كاش',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 13,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'اورانج كاش',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 13,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(IconsaxPlusLinear.record),
                        Icon(IconsaxPlusLinear.record),
                        Icon(IconsaxPlusLinear.record)
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        SizedBox(width: 190),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(
                            IconsaxPlusLinear.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'أضافه طريقه اخرى ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF606060),
                            fontSize: 14,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 111,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 390,
                  height: 2,
                  padding: const EdgeInsets.only(right: 156),
                  decoration: BoxDecoration(color: Color(0xFFF7F4FB)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 234,
                        height: 4,
                        clipBehavior: Clip.antiAlias,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF20776B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    const Column(
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                          width: 110,
                          child: Padding(
                            padding: EdgeInsets.only(left: 26),
                            child: Text(
                              'الأجمالى',
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 13,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.39,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '1200 جنية',
                          style: TextStyle(
                            color: Color(0xFF20776B),
                            fontSize: 25,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 40),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Success2()),
                          );
                        },
                        child: Container(
                          width: 185,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: Color(0xFFE7E7E7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: const Text(
                              'التالي',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
