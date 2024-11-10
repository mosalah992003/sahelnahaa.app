import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Success2 extends StatelessWidget {
  const Success2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'تفاصيل الحجز',
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 320),
            child: Icon(
              IconsaxPlusBold.tick_circle,
              color: Colors.green,
              size: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90, top: 20),
            child: Text(
              'شكرا لك , حجزك تم بنجاح',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.84,
              ),
            ),
          ),
          const SizedBox(
            width: 370,
            height: 60,
            child: Text(
              'من فضلك تابع أيميلك و الرقم المعطى وانتظر مكالمة التوصيل\n',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF424242),
                fontSize: 16,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.48,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Container(
              width: 390,
              height: 302,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 19,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 19,
                      ),
                      Container(
                        width: 43,
                        height: 41,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/shop/image 4.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(37.50),
                          ),
                        ),
                      ),
                      for (int i = 0; i < 4; i++)
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                      const Icon(Icons.star, color: Colors.grey, size: 16),
                      const SizedBox(
                        width: 140,
                      ),
                      const Text(
                        'عدد 1 مروحة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF20776B),
                          fontSize: 10,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    endIndent: 15,
                    indent: 25,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 9, left: 260, bottom: 8),
                    child: Text(
                      'معاد التسليم',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 12,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 250, bottom: 9),
                    child: Text(
                      'الأربعاء 5 مارس ',
                      style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 13,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.39,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 15,
                    indent: 25,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 270, bottom: 9, top: 9),
                    child: Text(
                      'رقم التواصل ',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 13,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.39,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 240, bottom: 9),
                    child: Text(
                      '010289684122',
                      style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 13,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.39,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 15,
                    indent: 25,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 290, bottom: 9, top: 9),
                    child: Text(
                      'العنوان ',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 13,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.39,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 210),
                    child: Text(
                      'الدقهلية شارع الجلاء12',
                      style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 13,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.39,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 118,
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
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 390,
                  height: 2,
                  decoration: const BoxDecoration(color: Color(0xFFF7F4FB)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 390,
                        height: 4,
                        clipBehavior: Clip.antiAlias,
                        decoration:
                            const BoxDecoration(color: Color(0xFF20776B)),
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
                      child: Container(
                        width: 185,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF207768),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'تم بنجاح',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.48,
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
