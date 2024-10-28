import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SavedLocation extends StatelessWidget {
  const SavedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF9F9F9),
          title: const Center(
            child: Text(
              'العناويين المحفوظة',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF1B2431),
                fontSize: 22,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              width: 390,
              height: 144,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF2DB2A0)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    IconsaxPlusBold.tick_circle,
                    color: Color(0xff207768),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 7, left: 140),
                    child: Column(
                      children: [
                        Text(
                          'المنزل',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' ٨ شارع احمد كامل الدقهليه',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.39,
                          ),
                        ),
                        Text(
                          'مصر',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.39,
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          'تعديل العنوان',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF20776B),
                            fontSize: 16,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.48,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    IconsaxPlusBold.home_hashtag,
                    color: Color(0xff207768),
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
