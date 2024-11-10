import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/profile/visa_container.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  // Helper function to scale width
  double scaleWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width * (width / 390);
  }

  // Helper function to scale height
  double scaleHeight(BuildContext context, double height) {
    return MediaQuery.of(context).size.height * (height / 844);
  }

  // Helper function to scale font size
  double scaleFont(BuildContext context, double fontSize) {
    return MediaQuery.of(context).size.width * (fontSize / 390);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: scaleWidth(context, 20)),
            child: Text(
              'حفظ',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF454545),
                fontSize: scaleFont(context, 15),
                fontFamily: 'noto',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.45,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        title: Center(
          child: Text(
            'طرق الدفع',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: scaleFont(context, 22),
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 20),
        ),
        child: ListView(
          children: [
            SizedBox(height: scaleHeight(context, 30)),
            Padding(
              padding: EdgeInsets.only(
                  left: scaleWidth(context, 240),
                  bottom: scaleHeight(context, 20)),
              child: Text(
                'طرق دفع بنكية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: scaleFont(context, 16),
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: scaleWidth(context, 390),
                height: scaleHeight(context, 283),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SizedBox(height: scaleHeight(context, 20)),
                    const VisaContainer(
                      image: "assets/images/logos_visa.png",
                      name: "Visa Bank",
                    ),
                    SizedBox(height: scaleHeight(context, 10)),
                    const VisaContainer(
                      image: "assets/images/Group 34249.png",
                      name: "Master card",
                    ),
                    SizedBox(height: scaleHeight(context, 10)),
                    const VisaContainer(
                      image: "assets/images/image 38.png",
                      name: "Telda Card",
                    ),
                    SizedBox(height: scaleHeight(context, 16)),
                    Row(
                      children: [
                        SizedBox(width: scaleWidth(context, 190)),
                        Container(
                          width: scaleWidth(context, 25),
                          height: scaleHeight(context, 25),
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
                        SizedBox(width: scaleWidth(context, 10)),
                        Text(
                          'أضافه طريقه اخرى ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF606060),
                            fontSize: scaleFont(context, 14),
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
            SizedBox(height: scaleHeight(context, 20)),
            Padding(
              padding: EdgeInsets.only(left: scaleWidth(context, 240)),
              child: Text(
                'طرق دفع اخرى',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: scaleFont(context, 16),
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: scaleHeight(context, 20)),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: scaleWidth(context, 390),
                height: scaleHeight(context, 135),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SizedBox(height: scaleHeight(context, 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/Gold coins and banknotes 3d cartoon style icon 1.png",
                          width: scaleWidth(context, 65),
                          height: scaleHeight(context, 65),
                        ),
                        Image.asset(
                          "assets/images/image 5.png",
                          width: scaleWidth(context, 65),
                          height: scaleHeight(context, 65),
                        ),
                        Image.asset(
                          "assets/images/image 7.png",
                          width: scaleWidth(context, 50),
                          height: scaleHeight(context, 50),
                        ),
                      ],
                    ),
                    SizedBox(height: scaleHeight(context, 2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'كاش عند الأستلام',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: scaleFont(context, 13),
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'فودافون كاش',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: scaleFont(context, 13),
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'اورانج كاش',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: scaleFont(context, 13),
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
            SizedBox(height: scaleHeight(context, 30)),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: scaleWidth(context, 390),
                height: scaleHeight(context, 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(IconsaxPlusLinear.arrow_left_1),
                    Text(
                      'العروض',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: scaleFont(context, 16),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(IconsaxPlusLinear.ticket_discount),
                  ],
                ),
              ),
            ),
            SizedBox(height: scaleHeight(context, 10)),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RepairView()),
                  );
                },
                child: Container(
                  width: scaleWidth(context, 390),
                  height: scaleHeight(context, 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(IconsaxPlusLinear.arrow_left_1),
                      Text(
                        'الخدمات',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: scaleFont(context, 16),
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(LineAwesomeIcons.wrench_solid),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
