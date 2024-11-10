import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/offers/cards.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';

class Offersview extends StatelessWidget {
  const Offersview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Column(
        children: [
          Container(
            width: 430,
            height: 276,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 45),
                Row(
                  children: [
                    const SizedBox(width: 363),
                    Image.asset(
                      "assets/cards/logo.png",
                      width: 28,
                      height: 23,
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Image.asset(
                      "assets/shop/offers.png",
                      width: 120,
                      height: 123,
                    ),
                    const SizedBox(width: 7),
                    Column(
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'تمتع الآن',
                                style: TextStyle(
                                  color: Color(0xFF20776B),
                                  fontSize: 20,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: ' \n',
                                style: TextStyle(
                                  color: Color(0xFF97144D),
                                  fontSize: 20,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'بأفضل العروض مع ',
                                style: TextStyle(
                                  color: Color(0xFF232323),
                                  fontSize: 20,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'سهلناها\n',
                                style: TextStyle(
                                  color: Color(0xFF20776B),
                                  fontSize: 20,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: Container(
                            width: 209,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: Color(0xFF20776B),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(
                          width: 200,
                          child: Text(
                            'عروض على الخدمات بـأنواعها',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 9,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(
                          width: 200,
                          child: Text(
                            'عروض على منتجات الماركت',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 9,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            Image.asset(
                              "assets/shop/image 22.png",
                              width: 35,
                              height: 26,
                            ),
                            const Text(
                              'عروض على الدفع بالطرق الالكترونية',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            // Added Expanded here
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 270),
                    child: Text(
                      'عروض الخدمات',
                      style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          height: 0.09),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Row(
                    children: [
                      Cards(photo: "assets/shop/Group 34321.png"),
                      SizedBox(
                        width: 9,
                      ),
                      Cards(photo: "assets/shop/Group 34322.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Cards(photo: "assets/shop/Group 34323.png"),
                      SizedBox(
                        width: 9,
                      ),
                      Cards(photo: "assets/shop/Group 34324.png"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 230),
                    child: Text(
                      'عروض مواقع التسوق',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/shop/Group 34311.png",
                        width: 60,
                        height: 64,
                      ),
                      SizedBox(
                        width: 43,
                      ),
                      Image.asset(
                        "assets/shop/Group 34312.png",
                        width: 60,
                        height: 64,
                      ),
                      SizedBox(
                        width: 43,
                      ),
                      Image.asset(
                        "assets/shop/Group 34313.png",
                        width: 60,
                        height: 64,
                      ),
                      SizedBox(
                        width: 43,
                      ),
                      Image.asset(
                        "assets/shop/Group 34314.png",
                        width: 60,
                        height: 64,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 290),
                    child: Text(
                      'عروض اخرى',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/shop/Group 34315.png",
                        width: 70,
                        height: 98,
                      ),
                      SizedBox(
                        width: 29,
                      ),
                      Image.asset(
                        "assets/shop/Group 34316.png",
                        width: 70,
                        height: 98,
                      ),
                      SizedBox(
                        width: 29,
                      ),
                      Image.asset(
                        "assets/shop/Group 34317.png",
                        width: 70,
                        height: 98,
                      ),
                      SizedBox(
                        width: 29,
                      ),
                      Image.asset(
                        "assets/shop/Group 34318.png",
                        width: 70,
                        height: 98,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
