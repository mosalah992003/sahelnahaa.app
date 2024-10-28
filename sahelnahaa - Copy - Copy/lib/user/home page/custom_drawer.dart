import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/home%20page/custom_list_drawer.dart';
import 'package:sahelnahaa/user/home%20page/image_picker.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color(0xff207768),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PicProfileImgWidget(),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'محمد عبد الفتاح',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '01000258962',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'شارع احمد كامل الدقهليه',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFCDCDD3),
                      fontSize: 12,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.36,
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomListDrawer(),
        ],
      ),
    );
  }
}
