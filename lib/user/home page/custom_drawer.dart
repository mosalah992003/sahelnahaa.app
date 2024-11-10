import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/home%20page/custom_list_drawer.dart';
import 'package:sahelnahaa/user/home%20page/image_picker.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Define base height and padding ratios for scaling
    double baseHeight = 250;
    double basePadding = 16;

    // Calculate responsive height and padding
    double responsiveHeight = screenSize.height *
        (baseHeight /
            812); // 812 is a common height reference (iPhone 11 Pro Max)
    double responsivePadding = basePadding *
        (screenSize.width / 375); // 375 is a common width reference (iPhone 11)

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: responsiveHeight,
            decoration: const BoxDecoration(
              color: Color(0xff207768),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PicProfileImgWidget(),
                  SizedBox(height: responsivePadding),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'محمد عبد الفتاح',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20 *
                                (screenSize.width /
                                    375), // Responsive font size
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '01000258962',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          16 * (screenSize.width / 375), // Responsive font size
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'شارع احمد كامل الدقهليه',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFCDCDD3),
                      fontSize:
                          12 * (screenSize.width / 375), // Responsive font size
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomListDrawer(),
        ],
      ),
    );
  }
}
